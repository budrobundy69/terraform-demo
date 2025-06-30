resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "S3 Website Bucket"
    Environment = "Production"
  }

  force_destroy = true # Allows deletion of the bucket even if it contains objects
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = var.bucket_name

  error_document {
    key = "error.html"
  }

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "allow" {
  bucket = aws_s3_bucket_website_configuration.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket_website_configuration.website.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowPublicRead"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.bucket.arn}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.allow]
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket_website_configuration.website.id
  key          = "index.html"
  source       = "${path.module}/../../index.html"
  content_type = "text/html"
}