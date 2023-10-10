terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  cloud {
    organization = "slack86"
    workspaces {
      name = "terra-house-slack86"
    }
 }

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid 
  token = var.terratowns_access_token
}
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "MacroViews" {
  name = "Macro Views"
  description = <<DESCRIPTION
  Macro views of the micro world...

  .
  DESCRIPTION
  content_version = 1
  town = "missingo"
  domain_name = module.terrahouse_aws.cloudfront_url
}
