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

## Dealing with Terraform configuration drift

## What happens if a state file is lost

If a state file is lost, all the infrastructure will most likely have to be torn down manually. Terraform import can be used but it's not available for all cloud resources. Check documentation.
git 
### Fix Missing Resources with Terraform Import

'terraform import aws_s3_bucket.example bucket_name'

[Terraform Import CLI Docs](https://developer.hashicorp.com/terraform/cli/import)

TODO: import.tf docs

### Fix Manual Configuration

If someone deletes or modifies cloud resources through clickops, the next terraform plan will attempt to put infrastructure back into the expected state to fix *configuration drift*

## Fix using Terraform Refresh

**Deprecated**
```tf
terraform apply -refresh-only -auto-approve
```

## Terraform Modules

### Terraform Module Structure

It is recommended to create modules in a 'modules' directory.

### Module Sources

[Module Sources](https://developer.hashicorp.com/terraform/language/modules/sources)

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
}
```
Using source the module can be imported from various places, for example:
- locally
- GitHub
- Terraform Registry

### Passing Input Variables

Input variables can be passed to the module by defining them in the module statement. The module must declare these variables in its own 'variables.tf'

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

## Consideration when using ChatGPT to write Terraform

LLMs such as ChatGPT may not be trained on the latest information about Terraform and other services. It may produce old examples that are decprecated. 

## Working with files in Terraform


### Path Variable

In Terraform there is a special variable called path that allows local paths to be referenced.

- path.module - get the path for the current module
- path.root - get the path for the root module

[Special Path Variable Docs](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)

```tf
resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.terrahome_bucket.bucket
  key = "error.html"
  source = "${path.root}/public/error.html"
  etag = filemd5(var.error_html_filepath)  
}
```

### File exists function

Terraform function to test the existsance of a file
```tf
  validation {
    condition = fileexists(var.error_html_filepath)
    error_message = "The provided path for error.html does not exists."
  }
```

### FileMD5

filemd5 is a variant of md5 that hashes the contents of a given file rather than a literal string. Allows you to comapre contents of a file to check for changes