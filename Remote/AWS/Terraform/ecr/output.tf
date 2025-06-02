output "repository_url" {
  description = "URL repository ECR"
  value       = aws_ecr_repository.repository.repository_url
}
