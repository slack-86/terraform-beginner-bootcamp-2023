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
