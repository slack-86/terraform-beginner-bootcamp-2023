# Terraform Beginner Bootcamp 2023 - Week 1

## Root Module Structure

Standard Terraform root module structure is as follows:
```
PROJECT_ROOT/
├── main.tf - everything else
├── variables.tf - stores the structure of input variables
├── providers.tf - defines required providers
├── outputs.tf - stores outputs
├── terraform.tfvars - the data of variables being loaded into the Terraform project
├── LICENSE - required
└── README.md - required for root modules
```
    
[Standard Terraform Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
