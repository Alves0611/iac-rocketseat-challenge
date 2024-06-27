variable "region" {
  description = "The AWS region to deploy in"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "The environment to deploy (dev, staging, prod)"
  type        = string
  default     = "dev"
}
