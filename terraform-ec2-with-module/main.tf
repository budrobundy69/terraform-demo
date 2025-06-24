provider "aws" {
  region = var.aws_region
}

module "my_ec2" {
  source           = "./modules/ec2_instance" # Path to the EC2 module
  instance_type    = var.instance_type        # Instance type variable
  ami_id           = var.ami_id               # AMI ID variable
  key_name         = var.key_name             # Key pair name for SSH access
  ssh_ingress_cidr = var.ssh_ingress_cidr     # CIDR block for SSH ingress

  tags = var.tags # Tags for the instance
}
