variable "aws_region" {
  type        = string
}
variable "vpc_name" {
  type        = string
}
variable "instance_names" {
  description = "Instances map"
  type = map(object({
    instance_type = string
    subnet_index  = number
  }))
}
variable "public_subnets" {
  type        = list(string)
}

variable "private_subnets" {
  type        = list(string)
}
variable "azs" {
  description = "List Availability Zones"
  type        = list(string)
}

variable "key_name" {
  description = "key name access for EC2"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}
variable "user_data_script" {
  description = "backend file path"
  type        = string
}
variable "environment" {
  type        = string
}
variable "ami_id" {
  description = "AMI для запуска EC2-инстансов"
  type        = string
}