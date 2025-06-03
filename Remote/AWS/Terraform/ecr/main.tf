provider "aws" {
  region = var.aws_region
}
terraform {
  backend "s3" {                     
    encrypt = true                                 
  }
}
module "ecr_repositories" {
  for_each = { for repo in var.repository_name : repo => repo }

  source  = "terraform-aws-modules/ecr/aws"
  version = "2.4.0"

  repository_name = each.key

  create_repository                   = true
  repository_force_delete             = true
  repository_image_tag_mutability     = "MUTABLE"
  repository_image_scan_on_push       = true
  create_lifecycle_policy             = false

  tags = {
    Environment = var.environment
  }
}

