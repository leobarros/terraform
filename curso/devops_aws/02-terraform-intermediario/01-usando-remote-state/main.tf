terraform {
  required_version = "0.14.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.60.0"
    }
  }

  backend "s3" {
    # Comentando para testar outras formas de usar o remote state.
    # Veja no readme como usar outras forma de backend.

    # bucket  = "tfstate-553783382292"
    # key     = "dev/01-usando-remote-state/terraform-tfstate"
    # region  = "us-east-1"
    # profile = "pessoal"
  }

}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}
