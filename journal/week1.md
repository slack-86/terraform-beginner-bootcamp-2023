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

The `auto.tfvars` file in Terraform is a file that automatically loads variable values without the need for explicit command-line flags or environment variable settings. 

Terraform looks for this file in the same directory as your configuration files and automatically reads variable assignments from it during execution. 

This feature simplifies the process of providing values for variables and is especially useful for sensitive information like API keys or secrets that should not be exposed in plaintext in your Terraform code.

#### var flag

The '-var' flag can be used to set or override a variable eg. 'terraform plan -var user="test"'

#### var file flag

The '-var-file' flag allows a specific '.tfvars' file to be specified for a terraform command containing the required variables. These will override other variables set in the project.

#### order of Terraform variables

The order of variable assignment from highest precidence to lowest is as follows:
```
1. CLI flags - can set or override a variable set below
2. TF files
3. ENV variables
4. HCL expression generated variables
5. Default variables
```

## Terraform Cloud Variables

In terraform two types of variable can be set
- Enviroment Variables - those you would set in your bash terminal
- Terraform Variables - those you would set in your tfvars

These can be set to be sensative so they are stored in Vault can not be shown after entry.



