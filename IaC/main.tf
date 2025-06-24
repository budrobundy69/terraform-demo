provider "aws" {
  region = var.aws_region  # Frankfurt
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  force_destroy = true

  tags = {
    Projekt = var.project_name
    Umgebung = var.environment
  }
}

