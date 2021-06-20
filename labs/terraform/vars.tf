variable "amis" {
  type = "map"

  default = {
    "us-east-1" = "ami-09e67e426f25ce0d7"
    "us-east-2" = "ami-0d8d212151031f51c"
  }
}

variable "cdirs_acesso_remoto" {
  type = "list"

  default = ["192.141.74.48/32", "192.141.74.54/32"]
}

variable "key_name" {
  default = "terraform-aws"
}