provider "aws" {
  region = var.aws_region # Frankfurt
}

module "website" {
  source      = "./modules/s3_website"
  bucket_name = var.bucket_name
}