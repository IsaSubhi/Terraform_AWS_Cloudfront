output "cloudfront_arn" {
  value = aws_cloudfront_distribution.cloudfront_dist.arn
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.cloudfront_dist.domain_name
}