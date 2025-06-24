variable "instance_type" {
  type = string                     # The type of the variable, in this case a string
  description = "The type of EC2 instance" # Description of what this variable represents
}

variable "ami_id" {
  type = string                     # The type of the variable, in this case a string
  description = "The AMI ID for the EC2 instance" # Description of what this variable represents
}

variable "key_name" {
  type = string                     # The type of the variable, in this case a string
  description = "The name of the key pair to use for SSH access to the EC2 instance" # Description of what this variable represents
}

variable "tags" {
  type = map(string)                # The type of the variable, in this case a map of strings
  description = "Tags to apply to the EC2 instance" # Description of what this variable represents
}

variable "ssh_ingress_cidr" {
  type = string                     # The type of the variable, in this case a string
  description = "CIDR block for SSH ingress rule" # Description of what this variable represents
}