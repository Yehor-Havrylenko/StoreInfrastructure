output "bucket_name" {
  value       = aws_s3_bucket.this.bucket
}

output "bucket_regional_domain_name" {
  value       = aws_s3_bucket.this.bucket_regional_domain_name
}

/*output "cloudfront_domain_name" {
  description = "domain name CloudFront Distribution"
  value       = aws_cloudfront_distribution.frontend_distribution.domain_name
}*/
