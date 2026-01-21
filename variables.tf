variable "aws_region" {
  type        = string
  description = "AWS region for backend resources"
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Prefix used for naming backend resources"
  default     = "swecha-multicloud"
}
