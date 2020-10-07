provider "aws" {
  region = "${lookup(var.region, var.env)}"
}

locals {
  common_tags = {
    "Project" = "AWS with Terraform"
    "Owner"   = "Leonardo Barros"
    "Year"    = "2020"
  }

  file_ext    = "zip"
  object_name = "my-data"
}

resource "random_id" "bucket" {
  byte_length = 4
}

data "template_file" "json" {
  template = "${file("file.json.tpl")}"

  vars = {
    age    = 37
    eye    = "Brown"
    name   = "Leonardo"
    gender = "Male"
  }
}

data "archive_file" "json" {
  type        = "zip"
  output_path = "${path.module}/files/${local.object_name}.${local.file_ext}"

  source {
    content  = "${data.template_file.json.rendered}"
    filename = "${local.object_name}.json"
  }
}

module "bucket" {
  source = "../s3"

  name = "my-bucket-${random_id.bucket.hex}"
  tags = "${merge(local.common_tags, map("name", "My bucket"), map("env", format("%s", var.env)))}"

  create_object = true
  object_key    = "${random_id.bucket.hex}.${local.file_ext}"
  object_source = "${data.archive_file.json.output_path}"
}
