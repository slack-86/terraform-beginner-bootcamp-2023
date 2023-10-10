#output "bucket_name" {
#    description = "Bucket name for static website hosting"
#    value = module.terrahouse_aws.bucket_name
#}
output "s3_terrahome_endpoint" {
    description = "S3 Static Website Hosting endpoint for Terrahome"
    value = module.terrahouse_aws.terrahouse_endpoint
}
output "cloudfront_url" {
    description = "The cloudfront distribution domain name"
    value = module.terrahouse_aws.cloudfront_url
}
output "s3_terrahome_bucket_name" {
    description = "Main terrahouse bucket name."
    value = module.terrahouse_aws.bucket_name
}