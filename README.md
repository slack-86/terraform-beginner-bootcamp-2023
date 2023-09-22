# Terraform Beginner Bootcamp 2023

## Semantic Versioning

This project is going to utilize semantic versioning for its tagging. 

See [semver.org](https://semver.org/) for more information.

The general format will be **MAJOR.MINOR.PATCH**, eg. 1.0.4

- **MAJOR** version when you make incompatible API changes.
- **MINOR** version when you add functionality in a backward compatible manner.
- **PATCH** version when you make backward compatible bug fixes.

## Install the terraform CLI

### Terraform CLI installation changes

The Terraform CLI installation instrucitons have changed due to GPG keyring changes. The original gitpod.yml configuration needed to be updated to conform to these changes.

[Install Terraform CLI Documentation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux distrobution

This project is built against Ubuntu. 
Consider checking your Linux distrobution and change accordingly for your Linux distrobution's needs. 

Example of checking Linux distrobution:
```
$ cat /etc/os-release 

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

### Refactoring Terraform CLI installation into bash script

While fixing the Terraform CLI GPG deprecation issues we decided to place the installation steps into a bash script [./bin/install_terraform_cli](./bin/install_terraform_cli). 

- This will keep the Terraform gitpod task file [.gitpod.yml](./.gitpod.yml) tidy.
- This will allow for easier debugging and ability to manually run the installation process
- This will allow better portability to other projects that need to install Terraform CLI

### Refactoring AWS CLI installation into bash script 

The AWS CLI installation was refactored into a bash script [./bin/install_aws_cli](./bin/install_aws_cli) to match.

We can check if AWS is installed correctly by running the following command:
```
aws sts get-caller-identity
```

[AWS CLI env vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)
```
$ export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
$ export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
$ export AWS_DEFAULT_REGION=us-west-2
```

## Terraform basics

### Terraform registry

Terraform sources providers and modules from the terraform registry which is located at [registry.terraform.io](https://registry.terraform.io)

- **Providers** are interfaces to APIs that allow the creation of resources in terraform.
- **Modules** are a way to make large amounts of Terraform code modular, portable, and shareable.

## Terraform console

```
$ terraform
```
The command Terraform with no arguments will list all possible commands

#### Terraform init

```
$ terraform init
```

This command will initialize the terraform environment by downloading the binaries for the providers used in the project.

#### Terraform plan

```
$ terraform plan
```

This will generate a change set showing what stands to be changed from the current state.

#### Terraform apply

```
$ terraform apply
```

This will run a plan and pass the change set to terraform to be executed. Apply will prompt Yes or No. The '--auto-approve' flag allows this to be bypassed.

```
$ terraform apply --auto-approve
```
#### Terraform destroy
```
$ terraform destroy
```
This will destroy resources. --auto-approve can bes used. 

#### Terraform state files

`.terraform.tfstate` contains information about the current state of the infrastructure. This file should never be committed to version control. This file can contrain sensative data, losing this file means losting knowing the state of your infrastructure. 

`.terraform.tfstate.backup` contains the previous version of the state file

#### Terraform lock files

`.terraform.lock.hcl` contains the locked versioning for the providers or modules used in this project. The terraform lock file should be committed to version control. 

#### Terraform directory

`./.terraform` this hidden folder mainly contains binaries of terraform providers

## Issues with Terraform Cloud Login and Gitpod
The 'terraform login' commands opens a link to the terraform website in Lynx, the CLI web browser, which is unusable to navigate the Terraform website.

The solution is to press 'P' to print the link and open that in a modern browser to generate the login token.

Once the token is generated, CTRL+C to quit Lynx and paste in the generated login token to continue. 

