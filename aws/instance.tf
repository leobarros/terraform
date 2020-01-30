provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "terrauser"
}

resource "aws_instance" "web" {
  ami             = "ami-00a208c7cdba991ea"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.my-key.key_name}"
  security_groups = ["${aws_security_group.allow_ssh.name}"]
}

resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  #ssh acess
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "web_public_dns" {
  value = "${aws_instance.web.public_dns}"
}