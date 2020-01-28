resource "aws_s3_bucket" "s3_example" {
  bucket = "${var.name}"
  acl    = "${var.acl}"

  versioning {
    enabled = "${var.versioning}"
  }

  tags = "${var.tags}"
}

resource "aws_s3_bucket_object" "s3_example" {
  count  = "${var.create_object ? 1 : 0}"
  bucket = "${aws_s3_bucket.s3_example.id}"
  key    = "${var.object_key}"
  source = "${var.object_source}"
  etag   = "${md5(file(var.object_source))}"
}
