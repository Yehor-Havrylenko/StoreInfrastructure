output "ecr_repository_urls" {
  description = "Map of repository names to their URLs"
  value       = { for key, mod in module.ecr_repositories : key => mod.repository_url }
}

