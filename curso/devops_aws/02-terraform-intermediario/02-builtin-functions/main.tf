terraform {
  required_version = "0.14.4"


  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.62.0"

    }

    archive = {
      source  = "hashicorp/archive"
      version = "2.0.0"
    }

    randon = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }

    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
  }
}


provider "aws" {
  region  = var.aws_region
  profile = "pessoal"
}