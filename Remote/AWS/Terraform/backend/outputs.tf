output "instance_public_ip" {
  description = "public ip address EC2 instance"
  value       = aws_instance.backend.public_ip
}
