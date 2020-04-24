provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "${var.profile}"
}

# remote-state
# run terraform apply in remote-state-bucket folder before

terraform {
  backend "s3" {
    bucket                  = "remote-state-bucket-dev-0101"
    key                     = "ec2/ec2.tfstate"
    region                  = "us-east-1"
    shared_credentials_file = "~/.aws/credentials"
    profile                 = "terraform"
  }
}

resource "aws_instance" "web" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  user_data = "${file("install_apps.sh")}"

  tags = "${var.tags}"
}
