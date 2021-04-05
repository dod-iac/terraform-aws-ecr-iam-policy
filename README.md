## Usage

Creates an IAM policy that allows downloading of images from an AWS ECR repo.

```hcl
module "ecr_iam_policy" {
  source = "dod-iac/ecr-iam-policy/aws"

  name = format("%s-ecr-user-%s", var.application, var.environment)
  repos = [aws_ecr_repository.main.arn]
}
```

Creates an IAM policy that allows downloading and uploading of images to an AWS ECR repo.

```hcl
module "ecr_iam_policy" {
  source = "dod-iac/ecr-iam-policy/aws"

  allow_write = true
  name = format("%s-ecr-user-%s", var.application, var.environment)
  repos = [aws_ecr_repository.main.arn]
}
```

## Terraform Version

Terraform 0.13. Pin module version to ~> 1.0.0 . Submit pull-requests to master branch.

Terraform 0.11 and 0.12 are not supported.

## License

This project constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105.  However, because the project utilizes code licensed from contributors and other third parties, it therefore is licensed under the MIT License.  See LICENSE file for more information.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.55.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.55.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_account_alias.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_account_alias) | data source |
| [aws_iam_policy_document.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_write"></a> [allow\_write](#input\_allow\_write) | Allow uploading of new images. | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the AWS IAM policy.  Defaults to "The policy for [NAME]." | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the AWS IAM policy. | `string` | n/a | yes |
| <a name="input_repos"></a> [repos](#input\_repos) | The ARNs of the AWS ECR repos.  Use ["*"] to allow all repos. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) of the AWS IAM policy. |
| <a name="output_id"></a> [id](#output\_id) | The id of the AWS IAM policy. |
| <a name="output_name"></a> [name](#output\_name) | The name of the AWS IAM policy. |
