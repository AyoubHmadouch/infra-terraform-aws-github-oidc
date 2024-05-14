# outputs.tf 

output "vpc_id" {
  value       = aws_vpc.self.id
  description = "The vpc id."
}

output "igw_id" {
  value       = aws_internet_gateway.self.id
  description = "The igw id."
}

output "public_subnets_ids" {
  value       = [for subnet in aws_subnet.public : subnet.id]
  description = "The public subntes ids."
}

output "private_subnets_ids" {
  value       = [for subnet in aws_subnet.private : subnet.id]
  description = "The private subntes ids."
}

output "public_route_tables_ids" {
  value       = ["${aws_route_table.public[*].id}"]
  description = "The public route tables ids."
}

output "private_route_table_ids" {
  value       = ["${aws_route_table.private[*].id}"]
  description = "The private route tables ids."
}

output "ngw_id" {
  value       = var.ngw_enabled ? aws_nat_gateway.self[0].id : null
  description = "The id of the nat gateway."
}

output "nat_eip" {
  value       = var.ngw_enabled ? aws_eip.public[0].public_ip : null
  description = "The id of the nat gateway."
}
