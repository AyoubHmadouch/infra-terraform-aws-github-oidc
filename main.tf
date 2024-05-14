# main.tf

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  azs = slice(data.aws_availability_zones.available.names, 0, var.num_az)
  public_subnets = [for i in range(var.num_az) : {
    name       = "subnet-public-${var.environment}-${local.azs[i]}"
    az         = local.azs[i]
    cidr_block = cidrsubnet(var.vpc_cidr_block, 8, i)
  }]
  private_subnets = [for i in range(var.num_az) : {
    name       = "subnet-private-${var.environment}-${local.azs[i]}"
    az         = local.azs[i]
    cidr_block = cidrsubnet(var.vpc_cidr_block, 8, var.num_az + i)
  }]
  common_tags = {
    CreatedOn = formatdate("YYYY-MM-DD", timestamp())
  }
}

resource "aws_vpc" "self" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = var.vpc_tenancy

  tags = merge(local.common_tags, {
    Name = join("-", compact(["vpc", var.environment]))
  })
}

resource "aws_internet_gateway" "self" {
  vpc_id = aws_vpc.self.id

  tags = merge(local.common_tags, {
    Name = join("-", compact(["igw", var.environment]))
  })
}

resource "aws_subnet" "public" {
  for_each                = { for idx, subnet in local.public_subnets : idx => subnet }
  vpc_id                  = aws_vpc.self.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = merge(local.common_tags, {
    Name = each.value.name
  })
}

resource "aws_subnet" "private" {
  for_each          = { for idx, subnet in local.private_subnets : idx => subnet }
  vpc_id            = aws_vpc.self.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.az

  tags = merge(local.common_tags, {
    Name = each.value.name
  })
}

resource "aws_route_table" "public" {
  count  = length(local.public_subnets)
  vpc_id = aws_vpc.self.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.self.id
  }

  tags = merge(local.common_tags, {
    Name = "public-rt-for-subnet-${count.index + 1}"
  })
}

resource "aws_route_table" "private" {
  count  = length(local.private_subnets)
  vpc_id = aws_vpc.self.id

  tags = merge(local.common_tags, {
    Name = "private-rt-for-subnet-${count.index + 1}"
  })
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public[count.index].id
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}

resource "aws_eip" "public" {
  count  = var.ngw_enabled ? 1 : 0
  domain = "vpc"


  tags = merge(local.common_tags, {
    Name = join("-", compact(["eip", var.environment]))
  })
}

resource "aws_nat_gateway" "self" {
  count             = var.ngw_enabled ? 1 : 0
  connectivity_type = "public"
  allocation_id     = aws_eip.public[count.index].id
  subnet_id         = aws_subnet.public[0].id

  depends_on = [aws_internet_gateway.self, aws_eip.public]


  tags = merge(local.common_tags, {
    Name = join("-", compact(["ngw", var.environment]))
  })
}
