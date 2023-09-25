resource "aws_s3_bucket" "terrahome_bucket" {
  bucket = var.bucket_name
  tags = {
    userUUID = var.user_uuid
  }
}
