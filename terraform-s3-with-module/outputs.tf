output "bucket_arn" {
    description = "The ARN of the S3 bucket created."
    value       = module.my_s3_bucket.bucket_arn
}

output "bucket_name" {
    description = "The name of the S3 bucket created."
    value       = module.my_s3_bucket.bucket_name
}