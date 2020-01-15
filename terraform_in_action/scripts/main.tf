provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/creds"
  profile                 = "terrauser"
}

## EC2
resource "aws_instance" "web" {
  ami           = "${var.ubuntu_server}"
  instance_type = "${var.instance_ec2_select}"
}

## EC2

## S3
resource "aws_s3_bucket" "my_bucket" {
    bucket = "only-test-with-terraform01"
    acl    = "private"

    tags = {
        Name        = "My bucket test"
        Environment = "Prod"
    }
}

resource "aws_s3_bucket_object" "object" {
  bucket = "${aws_s3_bucket.my_bucket.id}"
  key    = "hello_world.txt"
  source = "hello_world.txt"
  etag   = "${filemd5("hello_world.txt")}"
}

output "bucket" {
  value = "${aws_s3_bucket.my_bucket.id}"
}

output "etag" {
  value = "${aws_s3_bucket_object.object.etag}"
}
## S3