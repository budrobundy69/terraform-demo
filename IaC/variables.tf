variable "aws_region" {
  type = string
  default = "eu-central-1"  # Frankfurt
}

variable "bucket_name" {
  type = string
}

variable "project_name" {
    type = string
    default = "Terraform-Einstieg"
}

variable "environment" {
    type = string
    default = "Test"
}