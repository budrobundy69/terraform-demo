output "website_url" {
  description = "The URL of the S3 website endpoint."
  value       = module.website.website_url
}

output "raw_s3_bucket_output" {
  value = module.website
}