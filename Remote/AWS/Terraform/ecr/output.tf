output "repository_urls" {
  description = "Map of repository names to their URLs"
  value = { for repo_name, repo in aws_ecr_repository.repository : repo_name => repo.repository_url }
}
