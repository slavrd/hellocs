# Terraform deploy hellocs

A terraform project to deploy the hellocs application from a GitHub release on an AWS EC2 instance  and Kitchen CI tests with Kitchen-Terraform.

## Prerequisites

### AWS Setup

* Create AWS access key
* Create an EC2 key pair
* Make sure the default security group in the VPC you will use allows SSH access from your IP

### Install Terraform

[Terraform installation instructions](https://www.terraform.io/intro/getting-started/install.html#installing-terraform)

### Set up rbenv - instructions for MAC

* Install rbenv - run `brew install rbenv`
* Initialize rbenv - add to `~/.bash_profile` line `eval "$(rbenv init -)"`
* Run `source ~/.bash_profile`
* Install ruby 2.3.1 with rbenv - run `rbenv install 2.3.1` , check `rbenv versions`
* Set ruby version for the project to 2.3.1 - run `rbenv local 2.3.1` , check `rbenv local`

### Install needed Ruby Gems

* Install bundler - run `gem install bundler`
* Install gems from Gemfile - run `bundle install`

## Terraform project Setup

### Create Terraform variables file

Create file test.tfvars in the project directory. In it place the following variables and their values as key-value pairs

```HCL
access_key = "your AWS access key id"
secret_key = "your AWS secret key"
region = "desired AWS region"
instance_type = "type of instance"
ec2-key-pair-name = "name of the key pair"
ssh-private-key-path = "path to the private key of the ec2-key-pair"
```

Optional variables to add:

```HCL
hellocs_version = "desired GitHub release version. Defaults to v0.1"
vpc_sg_ids = ["list of security groups for the instance"]
```

## Deploy with Terraform

* Run `terraform apply -var-file=test.tfvars` - to deploy the infrastructure and application on it.
* Run `terraform destroy -var-file=test.tfvars` - to destroy the infrastructure.

## Test with Kitchen CI

### Set up kitchen

* In .kitchen.yml set the section

```YAML
key_files:
  - path/to/AWS/key-pair/private/key
```

* Set up environment variables `AWS_REGION`, `AWS_ACCESS_KEY_ID` and `AWS_SECRET_KEY_ID` to the same values used in the test.tfvars file. Can use `AWS_PROFILE` if you have an appropriate AWS CLI profile set up.

### Run Kitchen tests

* List kitchen environment - `bundle exec kitchen list`
* Build kitchen environment - `bundle exec kitchen converge`
* Run kitchen tests - `bundle exec kitchen verify`
* Destroy kitchen environment - `bundle exec kitchen destroy`
* Automatically build, test, destroy - `bundle exec kitchen test`