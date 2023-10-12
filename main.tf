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

module "home_macromicro_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.macromicro.public_path
  content_version = var.macromicro.content_version
}

resource "terratowns_home" "MacroViews" {
  name = "Macro Views"
  description = <<DESCRIPTION
  Macro views of the micro world.
  DESCRIPTION
  content_version = var.macromicro.content_version
  town = "the-nomad-pad"
  domain_name = module.home_macromicro_hosting.domain_name
}

module "home_maccheese_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.maccheese.public_path
  content_version = var.maccheese.content_version
}

resource "terratowns_home" "MacCheese" {
  name = "The Perfect Mac and Cheese"
  description = <<DESCRIPTION
  Nothing compares to the perfect mac and cheese.
  DESCRIPTION
  content_version = var.maccheese.content_version
  town = "cooker-cove"
  domain_name = module.home_maccheese_hosting.domain_name
}

module "home_cats_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.cats.public_path
  content_version = var.cats.content_version
}

resource "terratowns_home" "Cats" {
  name = "Cats"
  description = <<DESCRIPTION
  Just some pics of my cats, in the outdoors. 
  DESCRIPTION
  content_version = var.cats.content_version
  town = "the-nomad-pad"
  domain_name = module.home_cats_hosting.domain_name
}