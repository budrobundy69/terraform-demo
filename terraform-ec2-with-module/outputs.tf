output "public_ip" {
  value = module.my_ec2.public_ip                                         # The actual value to be outputted
  description = "The public IP address of the EC2 instance" # Description of what this output represents
}