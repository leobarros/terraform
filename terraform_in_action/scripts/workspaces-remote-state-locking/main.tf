provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    # Bucket created with remote state step
    bucket         = "terraform-with-aws-664359936505-us-east-1-remote-state"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-with-aws-664359936505-us-east-1-remote-state"
  }
}

locals {
    # In the CLI I created new workspace with terraform workspace command
  env = "${terraform.workspace}"
}

resource "aws_instance" "web" {
  ami           = "${lookup(var.ami, local.env)}"
  instance_type = "${lookup(var.type, local.env)}"

  tags = {
    Name = "My webserver ${local.env}"
    Env  = "${local.env}"
  }
}