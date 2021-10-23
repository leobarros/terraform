resource "aws_iam_user" "the-accounts" {
  for_each = toset(["Tood", "James", "Alice", "Dottie"])
  name     = each.key
}