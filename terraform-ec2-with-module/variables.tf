variable "aws_region" {
  type    = string
  default = "eu-central-1"  # Frankfurt
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The type of EC2 instance"
}

variable "ami_id" {
  type        = string
  description = "The AMI ID for the EC2 instance"
}

variable "key_name" {
  type        = string
  description = "The name of the key pair to use for SSH access to the EC2 instance"
}

variable "tags" {
  type = map(string)
  default = {
    Projekt  = "Terraform-Einstieg"
    Umgebung = "Test"
  }
  description = "Tags to apply to the EC2 instance"
}

variable "ssh_ingress_cidr" {
  type        = string
  default     = "0.0.0.0/0"
  description = "CIDR block for SSH ingress rule"
}