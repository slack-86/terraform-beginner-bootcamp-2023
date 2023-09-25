resource "random_string" "bucket_name" {
  lower = true
  upper = false
  length           = 32
  special          = false
  override_special = ""
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
  tags = {
    userUUID = var.user_uuid
  }
}
