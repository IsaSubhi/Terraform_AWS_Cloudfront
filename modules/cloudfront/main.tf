resource "aws_cloudfront_origin_access_control" "site_access" {
  name                              = "site_access"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "cloudfront_dist" {
  enabled             = true
  default_root_object = "index.html"
  wait_for_deployment = true
  is_ipv6_enabled     = true
  
  origin {
    domain_name = var.domain_name
    origin_id   = "s3Origin"
    origin_access_control_id = aws_cloudfront_origin_access_control.site_access.id
    connection_attempts      = 3
    connection_timeout       = 10
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "s3Origin"
    viewer_protocol_policy = "allow-all"
    
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    
    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  price_class = "PriceClass_All"

}