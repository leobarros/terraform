variable "region" {
  default     = "us-east-1"
  description = "My favority region"
}

variable "ubuntu_server" {
  default     = "ami-04b9e92b5572fa0d1"
  description = "Ubuntu 18.04 LTS"
}

variable "instance_ec2_dev" {
  default     = "t2.micro"
  description = "type of instance in develop"
}

variable "tags" {
  type = "map"

  default = {
    "Name" = "nodejs"
    "Env"  = "Dev"
  }

  description = "tags to environment Develop"
}

variable "env" {
  default = "dev"
}

variable "remote-state-name" {
  default = "remote-states-terraform"
}
