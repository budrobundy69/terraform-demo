variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "eu-central-1" # Frankfurt
}

variable "bucket_name" {
  description = "Name of the S3 bucket to create"
  type        = string
}