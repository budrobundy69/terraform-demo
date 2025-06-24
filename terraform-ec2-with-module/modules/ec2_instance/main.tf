# VPC
resource "aws_vpc" "this" {
    cidr_block = "10.0.0.0/16"
}

# Subnet
resource "aws_subnet" "this" {
    vpc_id            = aws_vpc.this.id
    cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

# Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
}

# Route Table
resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.this.id
}

# Security Group
resource "aws_security_group" "allow_ssh" {

  name_prefix = "allow_ssh"
  vpc_id      = aws_vpc.this.id # Associate the security group with the VPC
  description = "Allow SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_ingress_cidr] # Use the variable for CIDR block
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }
}

resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.this.id # Associate the instance with the subnet
  vpc_security_group_ids = [aws_security_group.allow_ssh.id] # Attach the security group to the instance
    associate_public_ip_address = true # Ensure the instance has a public IP

  tags = {
    Name = "Terraform-EC2-Instance with own VPC"
  }
}