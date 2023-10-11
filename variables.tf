variable "teacherseat_user_uuid" {
  description = "User UUID"
  type        = string
}
variable "terratowns_endpoint" {
  description = "path to terratown endpoint"
  type = string
}
variable "terratowns_access_token" {
  description = "terratowns access token"
  type = string
}
variable "cats" {
  type = object({
    public_path = string
    content_version = number
  })
}
variable "maccheese" {
  type = object({
    public_path = string
    content_version = number
  })
}
variable "macromicro" {
  type = object({
    public_path = string
    content_version = number
  })
}

#old stuff
#variable "bucket_name" {
#  description = "Name of the S3 bucket"
#  type        = string
#}
#variable "index_html_filepath" {
#  description = "The filepath for index.html"
#  type = string
#}
#variable "error_html_filepath" {
#  description = "The filepath for error.html"
#  type = string
#}
#variable "content_version" {
#  description = "The content version (positive integer starting at 1)"
#  type        = number
#}
#variable "cats_public_path" {
#  description = "path to public folder"
#  type = string
#}
#variable "cats_content_version" {
#  description = "The content version (positive integer starting at 1)"
#  type        = number
#}
#variable "maccheese_public_path" {
#  description = "path to public folder"
#  type = string
#}
#variable "maccheese_content_version" {
#  description = "The content version (positive integer starting at 1)"
#  type        = number
#}
#variable "macromicro_public_path" {
#  description = "path to public folder"
#  type = string
#}
#variable "macromicro_content_version" {
#  description = "The content version (positive integer starting at 1)"
#  type        = number
#}
