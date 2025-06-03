variable "aws_region" {
  type        = string
  default     = "eu-central-1"
}
variable "bucket_name" {
  type        = string
}

variable "index_document" {
  type        = string
  default     = "index.html"
}

variable "error_document" {
  type        = string
  default     = "index.html"
}

variable "bucket_tags" {
  type        = map(string)
  default     = {}
}
variable "environment" {
  description = "env name"
  type        = string
  default     = "dev"
}
