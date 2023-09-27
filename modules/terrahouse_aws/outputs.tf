output "bucket_name" {
    value = aws_s3_bucket.terrahome_bucket.bucket
}
output "terrahome_endpoint" {
    value = aws_s3_bucket_website_configuration.terrahome_configuration.website_endpoint
}