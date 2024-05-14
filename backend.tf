# backend.tf 

terraform {
  backend "s3" {
    bucket  = "infra-terraform-aws-github-oidc"
    key     = "terraform.tfstate"
    region  = "eu-west-1"
    encrypt = true
  }
}
