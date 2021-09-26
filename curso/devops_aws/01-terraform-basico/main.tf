provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "bucket_s3" {
  bucket = "s3-bucket-280600"
  acl    = "private"

  tags = {
    Name        = "s3-bucket"
    Env         = "Dev"
    owner       = "Léo Barros"
    description = "Bucket de teste"
  }
}