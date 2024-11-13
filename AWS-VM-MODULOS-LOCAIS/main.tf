terraform {
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.1"
    }
  }

  backend "s3" {
    bucket = "felipedias-remote-state"
    key    = "aws-vm-modulos-locais/terraform.tfstate"
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

module "network" {
  source      = "./network"
  cidr_vpc    = "10.0.0.0/16"
  cidr_subnet = "10.0.2.0/24"
  environment = var.environment
}
