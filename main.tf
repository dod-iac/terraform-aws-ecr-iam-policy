/**
 * ## Usage
 *
 * Creates an IAM policy that allows downloading of images from an AWS ECR repo.
 *
 * ```hcl
 * module "ecr_iam_policy" {
 *   source = "dod-iac/ecr-iam-policy/aws"
 *
 *   name = format("%s-ecr-user-%s", var.application, var.environment)
 *   repos = [aws_ecr_repository.main.arn]
 * }
 * ```
 *
 * Creates an IAM policy that allows downloading and uploading of images to an AWS ECR repo.
 *
 * ```hcl
 * module "ecr_iam_policy" {
 *   source = "dod-iac/ecr-iam-policy/aws"
 *
 *   allow_write = true
 *   name = format("%s-ecr-user-%s", var.application, var.environment)
 *   repos = [aws_ecr_repository.main.arn]
 * }
 * ```
 *
 * ## Terraform Version
 *
 * Terraform 0.13. Pin module version to ~> 1.0.0 . Submit pull-requests to master branch.
 *
 * Terraform 0.11 and 0.12 are not supported.
 *
 * ## License
 *
 * This project constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105.  However, because the project utilizes code licensed from contributors and other third parties, it therefore is licensed under the MIT License.  See LICENSE file for more information.
 */

data "aws_caller_identity" "current" {}

data "aws_iam_account_alias" "current" {}

data "aws_region" "current" {}

data "aws_partition" "current" {}

data "aws_iam_policy_document" "main" {

  statement {
    sid = "GetAuthorizationToken"
    actions = [
      "ecr:GetAuthorizationToken"
    ]
    resources = ["*"]
  }

  statement {
    sid = "GetImage"
    actions = [
      "ecr:ListImages",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetRepositoryPolicy",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
      "ecr:DescribeImages",
      "ecr:BatchGetImage",
    ]
    resources = var.repos
  }

  dynamic "statement" {
    for_each = var.allow_write ? [true] : []
    content {
      sid = "PutImage"
      actions = [
        "ecr:InitiateLayerUpload",
        "ecr:UploadLayerPart",
        "ecr:CompleteLayerUpload",
        "ecr:PutImage"
      ]
      resources = var.repos
    }
  }

}

resource "aws_iam_policy" "main" {
  name        = var.name
  description = length(var.description) > 0 ? var.description : format("The policy for %s.", var.name)
  policy      = data.aws_iam_policy_document.main.json
}
