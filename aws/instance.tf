provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/creds"
  profile                 = "terrauser"
}

resource "aws_instance" "web" {
  ami           = "ami-00a208c7cdba991ea"
  instance_type = "t2.micro"
}

