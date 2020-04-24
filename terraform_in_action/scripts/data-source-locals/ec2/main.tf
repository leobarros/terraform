provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "${var.profile}"
}

# remote-state
terraform {
  backend "s3" {
    bucket                  = "remote-state-bucket-dev-0101"
    key                     = "ec2/ec2.tfstate"
    region                  = "us-east-1"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "terraform"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "${var.instance_type}"

  tags = {
    Name = "data_source_local"
    Env  = "Dev"
  }
}
