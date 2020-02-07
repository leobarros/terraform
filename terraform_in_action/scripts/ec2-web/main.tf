provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "${var.profile}"
}

# remote-state
terraform {
  backend "s3" {
    bucket                  = "remote-state-bucket-dev"
    key                     = "ec2/ec2.tfstate"
    region                  = "us-east-1"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "lsales"
  }
}

resource "aws_instance" "web" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  tags = "${var.tags}"
}
