output "codebuild_service_role_arn" {
  value = aws_iam_role.codepipeline_service_role.arn
}

output "iam_policy_arns" {
  value = aws_iam_policy.codepipeline_service_role_policies.*.arn
}