variable "owner" {
  type        = string
  description = "The user who owns the resources"
  default     = "AyoubHmd"
}

variable "region" {
  type        = string
  description = "The region where to deploy the VPC"
  default     = "eu-west-1"
}

variable "project" {
  type        = string
  description = "The project name"
  default     = "infra-terraform-aws-github-oidc"
}

variable "environment" {
  type        = string
  description = "The environment"
  default     = "dev"
}

variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR Block for the VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_tenancy" {
  type        = string
  description = "The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host."
  default     = "default"
}

variable "num_az" {
  type        = string
  description = "The number of AZs."
  default     = "3"
}

variable "ngw_enabled" {
  type        = bool
  description = "Provision a nat gateway if needed."
  default     = false
}
