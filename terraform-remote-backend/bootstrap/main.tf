terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}
provider "aws" {
  region = "eu-central-1" # Frankfurt
}

resource "aws_s3_bucket" "tf_state" {
  bucket        = "budrobundy-terraform-remote-backend-bucket-001"
  force_destroy = true

  versioning {
    enabled = true
  }

  tags = {
    Name = "Terraform State Bucket"
  }
}

resource "aws_dynamodb_table" "tf_locks" {
  name         = "budrobundy-terraform-remote-backend-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        Name = "Terraform State Lock Table"
    }
}