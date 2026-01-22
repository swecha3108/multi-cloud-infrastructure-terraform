variable "project_name" { type = string }
variable "environment" { type = string }
variable "vpc_id" { type = string }

variable "ssh_cidr" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(string)
  default = {}
}
