## Terrahome AWS

```terraform
module "terrahome_cats" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.maccheese_public_path
  content_version = var.content_version
}
```

The public directory expects the following:
- index.html
- error.hmtl
- assets folder

All top level files in assets will be copied but not any sub directories

