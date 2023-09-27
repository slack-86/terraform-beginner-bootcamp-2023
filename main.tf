terraform {
 # cloud {
 #   organization = "slack86"
 #   workspaces {
 #     name = "terra-house-slack86"
 #   }
 #}

}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}

