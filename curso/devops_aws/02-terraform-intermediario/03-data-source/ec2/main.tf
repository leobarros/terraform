terraform {
  required_version = "0.14.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.63.0"
    }
  }

  backend "s3" {
    bucket  = "tfstate-553783382292"
    key     = "dev/03-data-sources-s3/terraform.tfstate"
    region  = "us-east-1"
    profile = "pessoal"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
