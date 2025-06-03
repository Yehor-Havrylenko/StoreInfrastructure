aws_region         = "eu-central-1"
vpc_name           = "backend-vpc"
subnet_name        = "backend-public-subnet"
availability_zone  = "eu-central-1a"

instance_names     = {
  "backend-instance" = {
    instance_type = "t3.micro"
    subnet_index  = 0
  }
}

public_subnets   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
azs              = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
key_name         = "learn"
vpc_cidr         = "10.0.0.0/16"
user_data_script = "scripts/backend_init.sh"
environment      = "dev"
ami_id           = "ami-08aa372c213609089"