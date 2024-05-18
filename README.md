<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.7.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.31.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.31.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.public](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/eip) | resource |
| [aws_internet_gateway.self](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.self](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/nat_gateway) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route_table_association) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/subnet) | resource |
| [aws_vpc.self](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/vpc) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment | `string` | `"dev"` | no |
| <a name="input_ngw_enabled"></a> [ngw\_enabled](#input\_ngw\_enabled) | Provision a nat gateway if needed. | `bool` | `false` | no |
| <a name="input_num_az"></a> [num\_az](#input\_num\_az) | The number of AZs. | `string` | `"3"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | The user who owns the resources | `string` | `"AyoubHmd"` | no |
| <a name="input_project"></a> [project](#input\_project) | The project name | `string` | `"infra-terraform-aws-github-oidc"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where to deploy the VPC | `string` | `"eu-west-1"` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | The CIDR Block for the VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_tenancy"></a> [vpc\_tenancy](#input\_vpc\_tenancy) | The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host. | `string` | `"default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_igw_id"></a> [igw\_id](#output\_igw\_id) | The igw id. |
| <a name="output_nat_eip"></a> [nat\_eip](#output\_nat\_eip) | The id of the nat gateway. |
| <a name="output_ngw_id"></a> [ngw\_id](#output\_ngw\_id) | The id of the nat gateway. |
| <a name="output_private_route_table_ids"></a> [private\_route\_table\_ids](#output\_private\_route\_table\_ids) | The private route tables ids. |
| <a name="output_private_subnets_ids"></a> [private\_subnets\_ids](#output\_private\_subnets\_ids) | The private subntes ids. |
| <a name="output_public_route_tables_ids"></a> [public\_route\_tables\_ids](#output\_public\_route\_tables\_ids) | The public route tables ids. |
| <a name="output_public_subnets_ids"></a> [public\_subnets\_ids](#output\_public\_subnets\_ids) | The public subntes ids. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The vpc id. |
<!-- END_TF_DOCS -->