## Terrahome AWS

```terraform
module "terrahome_home1" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.home1.public_path
  content_version = var.content_version
}
```

The public directory expects the following:
- index.html
- error.hmtl
- assets folder

All top level files in assets will be copied but not any sub directories

