variable "iam_policy_arns" {
  description = "list of all policies to be attached to the codebuild service role"
  type        = list(any)
  default     = []
}

variable "iam_policy_names" {
  description = "list of all policies to be attached to the codebuild service role"
  type        = list(any)
  default     = ["role_base_policy", "access_to_s3", "access_to_lambda"]
}

locals {
  iam_policy_json = [data.aws_iam_policy_document.codebuild_role_base_policy.json, data.aws_iam_policy_document.codebuild_access_to_s3.json, data.aws_iam_policy_document.codebuild_access_to_lambda.json]
}