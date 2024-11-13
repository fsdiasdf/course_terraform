variable "cidr_vpc" {
  description = "Cidr para a VPC criada na AWS"
  type        = string
}

variable "cidr_subnet" {
  description = "Cidr para a Subnet criada na AWS"
  type        = string
}

variable "environment" {
  description = "Ambientes a que pertencem os recursos criados na AWS"
  type        = string
}