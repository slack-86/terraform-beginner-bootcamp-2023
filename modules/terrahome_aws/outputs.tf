output "bucket_name" {
    value = aws_s3_bucket.terrahome_bucket.bucket
}
output "terrahouse_endpoint" {
    value = aws_s3_bucket_website_configuration.terrahome_configuration.website_endpoint
}
output "domain_name" {
    value = aws_cloudfront_distribution.s3_distribution.domain_name
}