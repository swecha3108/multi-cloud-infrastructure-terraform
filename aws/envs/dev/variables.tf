variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "multi-cloud-infra"
}

variable "environment" {
  type    = string
  default = "dev"
}
