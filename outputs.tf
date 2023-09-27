output "bucket_name" {
    description = "Bucket name for static website hosting"
    value = module.terrahouse_aws.bucket_name
}
output "terrahome_endpoint" {
    description = "S3 Static Website URL"
    value = module.terrahouse_aws.terrahome_endpoint
}