variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default     = "terraform"
  description = "Choose your profile"
}

variable "ami" {
  default     = "ami-04b9e92b5572fa0d1"
  description = "Ubuntu 18.04 LTS"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "tags" {
  type = "map"

  default = {
    Name        = "ec2_example"
    Environment = "Dev"
  }
}
