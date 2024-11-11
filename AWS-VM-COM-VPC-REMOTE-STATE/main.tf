terraform {
    required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.75.1"
    }
  }

  backend "s3" {
    bucket = "felipedias-remote-state"
    key    = "aws-vm/terraform.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
    region = "sa-east-1"
  default_tags {
    tags = {
      owner = "felipedias"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "felipedias-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "sa-east-1"
  }
}
