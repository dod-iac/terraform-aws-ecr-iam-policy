variable "allow_write" {
  description = "Allow uploading of new images."
  default     = false
  type        = bool
}

variable "description" {
  type        = string
  description = "The description of the AWS IAM policy.  Defaults to \"The policy for [NAME].\""
  default     = ""
}

variable "name" {
  type        = string
  description = "The name of the AWS IAM policy."
}

variable "repos" {
  type        = list(string)
  description = "The ARNs of the AWS ECR repos.  Use [\"*\"] to allow all repos."
}
