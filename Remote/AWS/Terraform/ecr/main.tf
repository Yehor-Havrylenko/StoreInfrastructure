provider "aws" {
  region = var.aws_region
}
terraform {
  backend "s3" {                     
    encrypt = true                                 
  }
}
resource "aws_ecr_repository" "repository" {
  name                 = var.repository_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = var.environment
  }
}
