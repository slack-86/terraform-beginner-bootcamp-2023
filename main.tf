terraform {
  cloud {
    organization = "slack86"
    workspaces {
      name = "terra-house-slack86"
    }
  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
     aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the Random Provider
provider "random" {
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "random_string" "bucket_name" {
  lower = true
  upper = false
  length           = 32
  special          = false
  override_special = ""
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result
}

output "random_bucket_name" {
    value = random_string.bucket_name.result
}