provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "terrauser"
}

#save the remote state
terraform {
  backend "s3" {
    bucket = "remote-states-terraform-dev"
    key    = "ec2/ec2.tfstate"

    #region = "us-east-1"
  }
}

resource "aws_instance" "web" {
  ami           = "${var.ubuntu_server}"
  instance_type = "${var.instance_ec2_dev}"

  #ipv6_addresses = "${var.ips}"
  tags = "${var.tags}"
}

module "bucket" {
  source     = "../s3"
  name       = "${var.remote-state-name}-${var.env}"
  versioning = true
}
