provider "aws" {
    region = var.aws_region  # Frankfurt
}

module "my_s3_bucket" {
    source      = "./modules/s3_bucket"
    bucket_name = var.bucket_name
    tags        = var.tags
}