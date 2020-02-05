provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "${var.profile}"
}

# random id
resource "random_id" "hex_id" {
  byte_length = 8
}

resource "random_id" "dec_id" {
  byte_length = 4
}

# random id

## EC2
resource "aws_instance" "web" {
  ami           = "${var.ubuntu_server}"
  instance_type = "${var.instance_ec2_select}"

  #ipv6_addresses = "${var.ips}"
  tags = "${var.tags}"
}

## EC2

## Using module S3
module "bucket" {
  source = "./s3"

  #using random_id in name string to set a variable name
  name       = "my-bucket-terraform-${random_id.hex_id.hex}"
  versioning = true

  tags {
    "Name" = "My note bucket"
  }

  create_object = true
  object_key    = "files/${random_id.hex_id.hex}.txt"
  object_source = "./s3/file.txt"
}

module "bucket-2" {
  source = "./s3"

  #using random_id in name string to set a variable name
  name = "my-bucket-terraform-${random_id.dec_id.dec}"
}

## Using module S3

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
