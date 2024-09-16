# variables.tf

variable "project_id" {
  description = "ivory-setup-433202-k0"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "db_password" {
  description = "password@123"
  type        = string
  sensitive   = true
}
