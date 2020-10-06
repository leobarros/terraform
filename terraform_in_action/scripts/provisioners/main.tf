provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "remote-state-bucket-dev-0101"
    key    = "ec2/ec2.tfstate"
    region = "us-east-1"
  }
}

locals {
  conn_type    = "ssh"
  conn_user    = "ec2-user"
  conn_timeout = "1m"

  # Please, do not upload your key. Ignore it in the .gitignore
  conn_key = "${file("terraform.pem")}"
}

resource "aws_instance" "web" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name      = "terraform"

  provisioner "file" {
    source      = "2020-09-18.log"
    destination = "/tmp/file.log"

    connection {
      type        = "${local.conn_type}"
      user        = "${local.conn_user}"
      timeout    = "${local.conn_timeout}"
      private_key = "${local.conn_key}"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 20",
      "echo \"[UPDATING THE SYSTEM]\"",
      "sudo yum update -y",
      "echo \"[INSTALLING HTTPD]\"",
      "sudo yum install -y httpd",
      "echo \"[STARTING HTTPD]\"",
      "sudo service httpd start",
      "sudo chkconfig httpd on",
      "echo \"[FINISHING]\"",
      "sleep 20",
    ]

    connection {
      type        = "${local.conn_type}"
      user        = "${local.conn_user}"
      timeout    = "${local.conn_timeout}"
      private_key = "${local.conn_key}"
    }
  }
}

resource "null_resource" "null" {
  provisioner "local-exec" {
    command = "echo ${aws_instance.web.id}:${aws_instance.web.public_ip} >> public_ips.txt"
  }
}

resource "tls_private_key" "pkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "keypair" {
  key_name   = "terraform.${var.env}"
  public_key = "${tls_private_key.pkey.public_key_openssh}"
}
