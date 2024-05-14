# backend.tf 

terraform {
  backend "s3" {
    bucket  = "terraform-backends"
    key     = "infra-terraform-aws-github-oidc/states/terraform.tfstate"
    region  = "eu-west-1"
    encrypt = true
  }
}