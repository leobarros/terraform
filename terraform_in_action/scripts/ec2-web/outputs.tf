output "remote_state_bucket_name" {
  value = "${module.bucket.name}"
}

#output "remote_state_bucket_arn" {
#  value = "${module.bucket.aws_s3_bucket.s3_example.arn}"
#}

