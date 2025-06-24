resource "aws_s3_bucket" "website" {
    bucket = var.bucket_name
    force_destroy = true

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

    tags = {
        Projekt   = "S3 Website"
    }
}

resource "aws_s3_bucket_public_access_block" "allow" {
    bucket = aws_s3_bucket.website.id

    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

resource aws_s3_bucket_policy "public_policy" {
  bucket = aws_s3_bucket.website.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "AllowPublicRead"
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.website.arn}/*"
      }
    ]
  })

    depends_on = [aws_s3_bucket_public_access_block.allow]
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.website.id
  key    = "index.html"
  source = "${path.module}/../../index.html"
  content_type = "text/html"
}