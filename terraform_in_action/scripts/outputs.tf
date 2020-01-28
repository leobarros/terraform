output "bucket" {
  value = "${module.bucket.name}"
}

output "bucket_object" {
  value = "${module.bucket.object}"
}

output "bucket-2" {
  value = "${module.bucket-2.name}"
}