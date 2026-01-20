variable "cluster_name" {
  default = "expense-tracker-cluster"
}

variable "app_name" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "hosted_zone_id" {
  type = string
}

variable "ci_role_arn" {
  type        = string
  description = "GitHub Actions IAM role ARN"
}
