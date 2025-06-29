ami_id            = "ami-0faab6bdbac9486fb"  # Amazon Linux 2 in eu-central-1
key_name          = "terraform-keypair"  # Ensure this key pair exists in your AWS account
instance_type     = "t2.micro"  # Change as needed
tags = {
  Projekt  = "Terraform-Einstieg"
  Umgebung = "Test"
}