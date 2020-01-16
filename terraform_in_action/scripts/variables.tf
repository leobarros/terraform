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
variable "instance_ec2_prod" {
    default     = "t2.medium"
    description = "type of instance in production"
}

variable "instance_ec2_select" {
    description = "You need to inform the instance type."
}

variable "ips" {
    type        = "list"
    default     = ["2607:f0d0:1002:51::4", 
                   "FE80::0202:B3FF:FE1E:8329"]
    description = "fake ips"
}

variable "tags" {
  type    = "map"
  default = {
      "Name" = "nodejs"
      "Env"  = "Dev"
  }
  description = "tags to environment Develop"
}
