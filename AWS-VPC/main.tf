terraform {
  required_providers {
    required_version = ">= 1.9.0"
    aws = {
      source  = "hashicorp/aws"
      version = "5.74.0"
    }
  }

  backend "s3" {
    bucket = "felipedias-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = {
      owner      = "felipedias"
      managed-by = "terraform"
    }
  }
}