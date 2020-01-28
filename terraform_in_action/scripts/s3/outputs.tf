output "name" {
  value = "${aws_s3_bucket.s3_example.id}"
}

output "object" {
  value = "${aws_s3_bucket_object.s3_example.*.key}"
}
