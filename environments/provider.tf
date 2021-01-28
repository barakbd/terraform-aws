provider "aws" {
  allowed_account_ids     = var.account_ids
  region                  = "us-east-1"
  shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = var.aws_profile
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
