# Terraform Beginner Bootcamp 2023 - Week 2
## Table of Contents

1. [Working with Ruby](#working-with-ruby)
   1. [Bundler](#bundler)
      1. [Installing Gems](#installing-gems)
   2. [Sinatra](#sinatra)
2. [Terratowns Mock Server](#terratowns-mock-server)
   1. [Running the Mock Server](#running-the-mock-server)
3. [Custom Terraform Provider](#custom-terraform-provider)
   1. [CRUD](#crud)
   2. [Local Terraform Providers](#local-terraform-providers)
4. [Considerations when publishing to Terratowns](#considerations-when-publishing-to-terratowns)
   1. [Town names](#town-names)
   2. [Multiple Homes](#multiple-homes)

## Working with Ruby

### Bundler

Bundler is Ruby's package manager. It is the primary way to install Ruby packages (gems). 

#### Installing Gems

1) Create a Gemfile
2) Define Gems in the Gemfile eg.
```ruby
# frozen_string_literal: true

source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```
3) Run 'bundle install'

This will install the gems on the system globally.

A Gemfile.lock will be created to lock the gem versions being used.

#### Executing Ruby scripts in the context of bundler

Bundle exec is used to tell future Ruby scripts to use the bundly of gems installed on the system. This is how context is set.

## Sinatra 

Sinatra is a micro web framework for Ruby used to build webapps. It's great for mock of development servers and very simple projects. A webserver can be created in a single file.

[Sinatra Project](https://sinatrarb.com/)

## Terratowns Mock Server

### Running the Mock Server

The webserver can be run with the following commands

```ruby
bundle install
bundle exec ruby server.rb
```

All of the code for the server is in the 'server.rb' file.

## Custom Terraform Provider

### CRUD

Terraform Provider resources utilize CRUD

- Create
- Read
- Update
- Delete

The four basic acitions of a storage system

CRUD is inplemeted using Golang in the custom provider.

### Local Terraform Providers

Local providers are not published in the Terraform Registry. Because of this, the local execution option must be utilized when using Terraform Cloud to manage the state file.

## Considerations when publishing to Terratowns

### Town names

The town name can not be changed in place, the Terrahome needs to be deleted from Terratowns first and then republished to move it to a new town.

### Multiple Homes

Multiple homes can be published by using multiple module and resource blocks in main.tf eg. 

'''tf
module "home1_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.home1.public_path
  content_version = var.home1.content_version
}

resource "terratowns_home" "home1" {
  name = "Home 1"
  description = <<DESCRIPTION
  Home 1 Description
  DESCRIPTION
  content_version = var.home1.content_version
  town = "the-nomad-pad"
  domain_name = module.home1_hosting.domain_name
}

module "home2_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.home2.public_path
  content_version = var.home2.content_version
}

resource "terratowns_home" "home2" {
  name = "Home 2"
  description = <<DESCRIPTION
  Home 2 Description
  DESCRIPTION
  content_version = var.home2.content_version
  town = "cooker-cove"
  domain_name = module.home2_hosting.domain_name
}
'''

with the corresponding variables setup as objects within 'variables.tf'

'''tf
variable "home1" {
  type = object({
    public_path = string
    content_version = number
  })
}
variable "home2" {
  type = object({
    public_path = string
    content_version = number
  })
}
'''

The variable's values for the 2 homes are set within 'terraform.tfvars' as such:

'''tf
home1 = {
    public_path = "/workspace/terraform-beginner-bootcamp-2023/public/home1"
    content_version = 5
}

home2 = {
    public_path = "/workspace/terraform-beginner-bootcamp-2023/public/home2"
    content_version = 6
}
'''








