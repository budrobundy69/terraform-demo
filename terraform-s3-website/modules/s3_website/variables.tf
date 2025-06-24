variable "bucket_name" {
    description = "The name of the S3 bucket to create."
    type        = string
}

variable "aws_region" {
    description = "AWS region to deploy resources in"
    type        = string
    default     = "eu-central-1"  # Frankfurt
}

variable "project_name" {
    description = "Name of the project"
    type        = string
    default     = "Terraform-Einstieg"
}

variable "environment" {
    description = "Environment for the project"
    type        = string
    default     = "Test"
}

variable "tags" {
    description = "Tags to apply to the S3 bucket"
    type        = map(string)
    default     = {
        Projekt   = "Terraform-Einstieg"
        Umgebung  = "Test"
    }
}