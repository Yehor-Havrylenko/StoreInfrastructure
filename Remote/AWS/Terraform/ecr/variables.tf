variable "aws_region" {
  type        = string
  default     = "eu-central-1"
}

variable "repository_name" {
  description = "name ecr repository"
  type        = list(string)
}

variable "environment" {
  description = "environment tag (dev, stage, prod)"
  type        = string
  default     = "dev"
}