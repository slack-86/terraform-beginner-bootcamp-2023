variable "user_uuid" {
  description = "User UUID"
  type        = string
}
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}
variable "index_html_filepath" {
  description = "The filepath for index.html"
  type = string
}
variable "error_html_filepath" {
  description = "The filepath for error.html"
  type = string
}