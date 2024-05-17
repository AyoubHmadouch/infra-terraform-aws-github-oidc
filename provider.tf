# provider.tf 

terraform {
  required_version = ">=1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }


}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Project     = var.project
      ManagedBy   = "Terraform"
      CreatedBy   = var.owner
      Environment = var.environment
    }
  }
}
