# main.tf
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "local" {}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

resource "local_file" "app_config" {
  filename = "${path.module}/generated-${var.environment}.txt"
  content  = <<EOF
Application Configuration
Environment = ${var.environment}
Managed By   = Terraform
EOF
}

output "config_file" {
  value = local_file.app_config.filename
}