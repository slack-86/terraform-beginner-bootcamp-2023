terraform {
 # cloud {
 #   organization = "slack86"
 #   workspaces {
 #     name = "terra-house-slack86"
 #   }
 #}
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
