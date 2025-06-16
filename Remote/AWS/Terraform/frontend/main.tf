provider "aws" {
  region = var.aws_region
}
terraform {
  backend "s3" {                      
    encrypt = true                                 
  }
}
/*
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
*/

module "frontend_s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.15.1"

  bucket = var.bucket_name

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = var.bucket_tags
}
# resource "aws_s3_bucket_policy" "frontend" {
#   bucket = module.frontend_s3_bucket.s3_bucket_id

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Sid    = "AllowCloudFrontServicePrincipal"
#         Effect = "Allow"
#         Principal = {
#           Service = "cloudfront.amazonaws.com"
#         }
#         Action   = "s3:GetObject"
#         Resource = "${module.frontend_s3_bucket.s3_bucket_arn}/*"
#         Condition = {
#           StringEquals = {
#             "AWS:SourceArn" = var.cloudfront
#           }
#         }
#       }
#     ]
#   })
# }