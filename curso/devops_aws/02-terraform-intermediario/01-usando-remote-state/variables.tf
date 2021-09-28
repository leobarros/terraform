variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "pessoal"
}

variable "ami" {
  description = ""
  default     = "ami-09e67e426f25ce0d7"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t3.micro"
}