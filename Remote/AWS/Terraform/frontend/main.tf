provider "aws" {
  region = var.aws_region
}
terraform {
  backend "s3" {                      
    encrypt = true                                 
  }
}

module "cloudfront" {
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "4.1.0"

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "My CloudFront distribution for a static website"
  default_root_object = "index.html"
  price_class         = "PriceClass_100"

 origin = [
    {
      origin_id   = "s3-origin" 
      domain_name = module.s3_bucket.bucket_regional_domain_name

      s3_origin_config = {
        origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
      }
    }
  ]

  default_cache_behavior = {
    target_origin_id       = "s3-origin"
    viewer_protocol_policy = "http-and-https"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    cached_methods         = ["GET", "HEAD", "OPTIONS"]
    compress               = true
  }

  tags = {
    Environment = var.environment
  }
}


resource "aws_cloudfront_origin_access_identity" "this" {
  comment = "OAI for CloudFront Access to S3"
}
resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  website {
    index_document = var.index_document
    error_document = var.error_document
  }

  tags = var.bucket_tags
}
