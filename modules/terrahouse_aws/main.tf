terraform {
  required_providers {
     aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


resource "aws_s3_bucket" "terrahome_bucket" {
  bucket = var.bucket_name
  tags = {
    userUUID = var.user_uuid
  }
}
resource "aws_s3_bucket_website_configuration" "terrahome_configuration" {
  bucket = aws_s3_bucket.terrahome_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
resource "aws_s3_object" "terrahome_index" {
  bucket = aws_s3_bucket.terrahome_bucket.bucket
  key = "index.html"
  source = "${path.root}/public/index.html"
  etag = filemd5("${path.root}/public/index.html")  
}