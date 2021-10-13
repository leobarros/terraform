resource "aws_s3_bucket" "this" {
  bucket = "leobarros-images-dev"
  acl = "public-read-write"

  tags = local.commom_tags
}

resource "aws_s3_bucket_object" "image" {
  bucket = aws_s3_bucket.this.bucket
  key = "image/${local.filepath}"
  source = local.filepath
  etag = filemd5(local.filepath)
  tags = local.commom_tags
}