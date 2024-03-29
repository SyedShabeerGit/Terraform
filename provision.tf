# Create a new instance of the latest Ubuntu 14.04 on an
# t2.micro node with an AWS Tag naming it "TestInstance"
provider "aws" {
  region = "us-east-2"
  shared_credentials_file = "%USERPROFILE%\\.aws\\credentials"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "ami-0dacb0c129b49f529"
  instance_type = "t2.micro"

  tags = {
    Name = "TestInstance"
  }
}
