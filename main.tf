# Create a script to initialise terraform to download dependencies required for AWS

# First step to create a block of code to communicate with AWS

provider "aws" {
  region = "eu-west-1"

}

# Launch an EC2 instance on AWS

# Let Terraform know which service to create

# Give some technical information

resource "aws_instance" "app_instance" {
  ami           = var.node_ami
  instance_type = "t2.micro"
  # Globally available
  associate_public_ip_address = true
  subnet_id                   = var.vpc_subnet
  # Name it
  tags = {
    Name = "eng110-jack-terraform-app"
  }
  key_name = var.aws_key_name

  vpc_security_group_ids = var.security_group
}


# Create a script to launch a VPC - then relaunch this ec2 in your vpc

resource "aws_vpc" "default" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  tags = {
    Name = "eng110-jack-vpc"
  }
}

# resource "aws_subnet" "main" {
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = var.subnet_cidr
#   availability_zone = "eu-west-1"

#   tags = {
#     Name = "eng110-jack-terraform-subnet"
#   }
# }

resource "aws_security_group" "allow_port_22" {
  name        = "allowing port 22"
  description = "allows port 22 from any ip"
  vpc_id      = aws_vpc.default.id

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = var.sg_ip_permission
  }

  tags = {
    Name = "eng110-test-terraform-sg"
  }
}
