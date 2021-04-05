output "arn" {
  description = "The Amazon Resource Name (ARN) of the AWS IAM policy."
  value       = aws_iam_policy.main.arn
}

output "id" {
  description = "The id of the AWS IAM policy."
  value       = aws_iam_policy.main.id
}

output "name" {
  description = "The name of the AWS IAM policy."
  value       = aws_iam_policy.main.name
}
