terraform {
    required_version = ">= 1.9.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.75.1"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      owner = "felipedias"
      managed-by = "terraform"
    }
  }
}