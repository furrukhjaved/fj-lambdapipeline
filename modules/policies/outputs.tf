output "codebuild_service_role_arn" {
  value = aws_iam_role.codebuild_service_role.arn
}

#output "iam_policy_arns" {
#  value = [aws_iam_policy.codebuild_role_base_policy.arn, aws_iam_policy.codebuild_access_to_s3.arn, aws_iam_policy.codebuild_access_to_lambda.arn]
#}

#output "iam_policies_json" {
#  value = [data.aws_iam_policy_document.codebuild_role_base_policy.json, data.aws_iam_policy_document.codebuild_access_to_s3.json, data.aws_iam_policy_document.codebuild_access_to_lambda.json]
#}

output "iam_policy_arns" {
  value = aws_iam_policy.codebuild_service_role_policies.*.arn
}