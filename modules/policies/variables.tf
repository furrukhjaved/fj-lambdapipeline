# Codebuild
variable "codebuild_iam_policy_names" {
  description = "list of names of all policies to be attached to the codebuild service role."
  type        = list(any)
  default     = ["role_base_policy", "access_to_s3", "access_to_lambda"]
}

# FYI, above names' order needs to match the order in the local.iam_policy_json list order.
locals {
  codebuild_iam_policy_json = [data.aws_iam_policy_document.codebuild_role_base_policy.json, data.aws_iam_policy_document.codebuild_access_to_s3.json, data.aws_iam_policy_document.codebuild_access_to_lambda.json]
}

# Codepipeline

variable "codepipeline_iam_policy_names" {
  description = "list of names of all policies to be attached to the codepipeline service role."
  type        = list(any)
  default     = ["role_base_policy"]
}

# FYI, above names' order needs to match the order in the local.iam_policy_json list order.
locals {
  codepipeline_iam_policy_json = [data.aws_iam_policy_document.codepipeline_role_base_policy.json]
}