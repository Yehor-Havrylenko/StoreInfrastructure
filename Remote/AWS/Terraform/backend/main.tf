provider "aws" {
  region = var.aws_region
}
terraform {
  backend "s3" {              
    encrypt = true                                 
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"

  name = var.vpc_name
  cidr = var.vpc_cidr
  azs  = var.azs

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Environment = var.environment
  }
}

module "ec2_instances" {
  for_each = var.instance_names

  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.0.0"

  name          = each.key
  ami           = var.ami_id
  instance_type = each.value.instance_type

  key_name = var.key_name
  subnet_id = module.vpc.public_subnets[each.value.subnet_index]

  vpc_security_group_ids = [module.vpc.default_security_group_id]

  tags = {
    Environment = var.environment
  }
}
