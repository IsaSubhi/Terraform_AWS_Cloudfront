resource "aws_s3_bucket" "s3_bucket" {
  bucket        = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "s3_bucket_website" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "3",
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Principal": {
        "Service": "cloudfront.amazonaws.com"
      },
      "Resource": "arn:aws:s3:::${aws_s3_bucket.s3_bucket.id}/*",
      "Condition": {
        "StringEquals": {
          "aws:SourceArn": "${var.cloudfront_arn}"
        }
      }
    }
  ]
}
POLICY
}

resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.s3_bucket.bucket
  key          = "index.html"
  source       = "./app/index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "image_file" {
  bucket       = aws_s3_bucket.s3_bucket.bucket
  key          = "image.jpg"
  source       = "./app/image.jpg"
  content_type = "image/jpeg" 
}