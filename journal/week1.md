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

## Terraform and Input Variables

[Terraform Input Variable Docs](https://developer.hashicorp.com/terraform/language/values/variables)

### Loading Terraform Varialbes

#### terraform.tfvars

This is the default file to load variables in vulk

#### auto.tfvars

TODO: Document

#### var flag
The '-var' flag can be used to set or override a variable eg. 'terraform plan -var user="test"'

#### var file flag

TODO: Document

#### order of Terraform variables

TODO: Document the order of terraform variables

## Terraform Cloud Variables

In terraform two types of variable can be set
- Enviroment Variables - those you would set in your bash terminal
- Terraform Variables - those you would set in your tfvars

These can be set to be sensative so they are stored in Vault can not be shown after entry.



