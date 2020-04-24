variable "name" {
  default = "remote-state-bucket-dev-0101"
  description = "You have to put a name in your resource"
}

variable "acl" {
  default = "private"
}

variable "versioning" {
  default = "false"
}

variable "tags" {
  type    = "map"
  default = {}
}

variable "object_key" {
  default = ""
}

variable "object_source" {
  default = ""
}

variable "create_object" {
  default = false
}
