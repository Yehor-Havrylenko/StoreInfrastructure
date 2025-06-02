variable "aws_region" {
  type        = string
  default     = "eu-central-1"
}

variable "bucket_name" {
  description = "s3 bucket name"
  type        = string
}

variable "environment" {
  description = "env name"
  type        = string
  default     = "dev"
}
