output "id" {
  value = "${aws_instance.web.id}"
}

output "ami" {
  value = "${aws_instance.web.ami}"
}

output "arn" {
  value = "${aws_instance.web.arn}"
}

output "public_dns" {
  value = "${aws_instance.web.public_dns}"
}

output "public_ip" {
  value = "${aws_instance.web.public_ip}"
}
