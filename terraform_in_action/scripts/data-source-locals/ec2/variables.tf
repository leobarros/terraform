variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default     = "terraform"
  description = "Choose your profile"
}

variable "instance_type" {
  default = "t2.nano"
}
