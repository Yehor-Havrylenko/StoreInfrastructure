output "vpc_id" {
  description = "ID created VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List public subnets"
  value       = module.vpc.public_subnets
}

output "ec2_instance_ids" {
  description = "Map ID created instances"
  value       = { for instance, mod in module.ec2_instances : instance => mod.this_instance_id }
  }
