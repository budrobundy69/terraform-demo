terraform {
    backend "s3" {
        bucket         = "budrobundy-terraform-remote-backend-bucket-001"
        key            = "ec2/terraform.tfstate"
        region         = "eu-central-1"
        dynamodb_table = "budrobundy-terraform-remote-backend-locks"
        encrypt        = true
    }
}