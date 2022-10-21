terraform {
  required_version = ">= 0.12.25"
}

provider "aws" {
  region = "eu-central-1"
  profile = "sandbox"
  shared_credentials_file = "~/.aws/credentials"
}
