# terraform {
#   required_version = "~> 0.12.3"
#   backend "remote" {
#       hostname = "app.terraform.io"
#       organization = "leobarroslabs"

#       workspaces {
#           name = "aws-leobarroslabs2"
#       }
#   }
# }

#backend with s3
terraform {
  backend "s3" {
    bucket = "tfstate-remote-leobarroslabs01"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}
