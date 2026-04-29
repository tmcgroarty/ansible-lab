variable "vpc_id" {}

variable "subnet_ids" {
  type = list(string)
}

variable "allowed_cidr" {
  default = "10.0.0.0/16"
}

variable "db_password" {
  sensitive = true
}
