provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/creds"
  profile                 = "terrauser"
}

resource "aws_s3_bucket" "bucket" {
    bucket = "only-test-with-terraform01"
    acl    = "private"

    tags = {
        Name        = "My bucket test"
        Environment = "Dev"
    }
}