#output "bucket_name" {
#    description = "Bucket name for static website hosting"
#    value = module.terrahouse_aws.bucket_name
#}
output "cats_s3_terrahome_endpoint" {
    description = "S3 Static Website Hosting endpoint for Terrahome"
    value = module.home_cats_hosting.terrahouse_endpoint
}
output "cats_cloudfront_url" {
    description = "The cloudfront distribution domain name"
    value = module.home_cats_hosting.domain_name
}
output "cats_s3_terrahome_bucket_name" {
    description = "Main terrahouse bucket name."
    value = module.home_cats_hosting.bucket_name
}
output "macromicro_s3_endpoint" {
    description = "S3 Static Website Hosting endpoint for Terrahome"
    value = module.home_macromicro_hosting.terrahouse_endpoint
}
output "macromicro_cloudfront_url" {
    description = "The cloudfront distribution domain name"
    value = module.home_macromicro_hosting.domain_name
}
output "macromicro_s3_bucket_name" {
    description = "Main terrahouse bucket name."
    value = module.home_macromicro_hosting.bucket_name
}
output "maccheese_s3_endpoint" {
    description = "S3 Static Website Hosting endpoint for Terrahome"
    value = module.home_maccheese_hosting.terrahouse_endpoint
}
output "maccheese_cloudfront_url" {
    description = "The cloudfront distribution domain name"
    value = module.home_maccheese_hosting.domain_name
}
output "maccheese_s3_bucket_name" {
    description = "Main terrahouse bucket name."
    value = module.home_maccheese_hosting.bucket_name
}