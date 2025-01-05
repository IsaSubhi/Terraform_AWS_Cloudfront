module "s3_bucket" {
  source = "./modules/S3_bucket"
  cloudfront_arn = module.cloudfront.cloudfront_arn
  bucket_name = var.bucket_name
}

module "cloudfront" {
  source = "./modules/cloudfront"
  domain_name = module.s3_bucket.domain_name
}