variable "aws_region" {
  type        = string
  default     = "eu-central-1"
}
variable "vpc_name" {
  type        = string
  default     = "backend-vpc"
}

variable "subnet_name" {
  type        = string
  default     = "backend-public-subnet"
}

variable "availability_zone" {
  type        = string
  default     = "eu-central-1a"
}
variable "instance_type" {
  description = "instance type EC2"
  type        = string
}

variable "key_name" {
  description = "key name access for EC2"
  type        = string
}

variable "instance_name" {
  type        = string
}

variable "user_data_script" {
  description = "backend file path"
  type        = string
}
variable "tfstate_key" {
  type = string
}