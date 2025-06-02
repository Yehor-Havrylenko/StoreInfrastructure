output "frontend_bucket_website_endpoint" {
  description = "web-endpoint for static site in S3"
  value       = aws_s3_bucket.frontend_bucket.website_endpoint
}

output "cloudfront_domain_name" {
  description = "domain name CloudFront Distribution"
  value       = aws_cloudfront_distribution.frontend_distribution.domain_name
}
