provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "${var.profile}"
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

resource "aws_instance" "webserver" {
  ami             = "${data.aws_ami.ubuntu.id}"
  instance_type   = "t2.micro"
  user_data       = "${file("install.sh")}"
  monitoring      = true
  key_name        = "${aws_key_pair.my-key.key_name}"
  security_groups = ["${aws_security_group.allow_ssh.name}", "${aws_security_group.allow_http.name}"]

  tags = {
    Name        = "webserver"
    Environment = "Dev"
  }
}

#chave ssh
resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"

  #ssh access
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

resource "aws_security_group" "allow_http" {
  name = "allow_http"

  #ssh access
  ingress {
    from_port   = 80
    to_port     = 80
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

#cloudwatch
resource "aws_cloudwatch_metric_alarm" "monitor_ec2" {
  alarm_name                = "alarm-ec2-80%"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
}
