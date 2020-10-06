variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-0d29b48622869dfd9"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "env" {
  default = "dev"
}

variable "key_pair_name" {
  default = "terraform"
}
