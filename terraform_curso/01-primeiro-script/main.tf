provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/creds"
  profile                 = "terrauser"
}

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
