# Terraform Beginner Bootcamp 2023 - Week 2

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


## CRUD

Terraform Provider resources utilize CRUD

- Create
- Read
- Update
- Delete

The four basic acitions of storage