terraform {
  required_version = "0.14.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.60.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "pessoal"
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-tf-test-bucket-280600200912180683"
  acl    = "private"

  tags = {
    Name        = "My first Terraform bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
    Owner       = "Leonardo Barros"
    CreatedAt   = "2021-09-25"
  }

}