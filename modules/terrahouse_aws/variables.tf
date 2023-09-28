variable "user_uuid" {
  description = "User UUID"
  type        = string

  validation {
    condition     = can(regex("^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})$", var.user_uuid))
    error_message = "User UUID must be a valid UUID format (e.g., 123e4567-e89b-12d3-a456-426614174000)"
  }
}
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9.-]{3,63}$", var.bucket_name))
    error_message = "S3 bucket name must be between 3 and 63 characters, lowercase letters, numbers, hyphens, and periods allowed, and must start and end with a letter or number."
  }
}
variable "index_html_filepath" {
  description = "The filepath for index.html"
  type = string

  validation {
    condition = fileexists(var.index_html_filepath)
    error_message = "The provided path for index.html does not exists."
  }


}
variable "error_html_filepath" {
  description = "The filepath for error.html"
  type = string

  validation {
    condition = fileexists(var.error_html_filepath)
    error_message = "The provided path for error.html does not exists."
  }


}

variable "content_version" {
  description = "The content version (positive integer starting at 1)"
  
  type        = number
  
  validation {
    condition     = var.content_version >= 1
    error_message = "Content version must be a positive integer starting at 1."
  }
}

variable "assets_path" {
  description = "path to assets folder"
  type = string
}