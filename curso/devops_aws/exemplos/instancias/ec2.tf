resource "aws_instance" "webserver" {
  ami           = var.ubuntu_instance
  instance_type = "t2.micro"

  tags = local.common_tags
}

