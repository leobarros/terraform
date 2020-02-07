provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "${var.profile}"
}

module "bucket" {
  source = "../s3"
  name = "remote-state-bucket-dev"
  versioning = true
  
}
