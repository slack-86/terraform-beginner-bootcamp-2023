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
variable "content_version" {
  description = "The content version (positive integer starting at 1)"
  type        = number
}
variable "assets_path" {
  description = "path to assets folder"
  type = string
}