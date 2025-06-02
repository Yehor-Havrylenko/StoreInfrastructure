variable "aws_region" {
  type        = string
  default     = "eu-central-1"
}

variable "repository_name" {
  description = "name ecr repository"
  type        = string
}

variable "environment" {
  description = "environment tag (dev, stage, prod)"
  type        = string
  default     = "dev"
}
variable "tfstate_key" {
  type = string
}