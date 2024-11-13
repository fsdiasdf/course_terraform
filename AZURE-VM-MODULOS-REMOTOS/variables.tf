variable "location" {
  description = "Região onde os recursos serão criados na Azure"
  type        = string
  default     = "Brazil South"
}

variable "environment" {
  description = "Ambiente a que pertencem os recursos criados na AZURE"
  type = string
  default = "DEV"
}