terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "boohoo-devops"

    workspaces {
      prefix = "fj-lambdapipeline-" # change to your current workspace
    }

  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.23"
    }
  }
}



provider "aws" {
  region = module.global_variables.AWS_DEFAULT_REGION
  default_tags {
    tags = {
      Application = module.global_variables.name_prefix
      Environment = module.global_variables.env
    }
  }
}