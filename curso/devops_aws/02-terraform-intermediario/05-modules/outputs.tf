output "bucket-name" {
  value = module.bucket.name
}

output "bucket-arn" {
  value = module.bucket.arn
}

output "bucket-website-name" {
  value = module.website.name
}

output "buckket-website-url" {
  value = module.website.website
}

output "bucket-website-arn" {
  value = module.website.arn
}

output "bucket-website-files" {
  value = modules.website.files
}