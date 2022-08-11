output "codebuild_service_role_arn" {
  value = aws_iam_role.codebuild_service_role.arn
}

output "iam_policy_arns" {
  value = [aws_iam_policy.codebuild_role_base_policy.arn, aws_iam_policy.codebuild_access_to_s3.arn, aws_iam_policy.codebuild_access_to_lambda.arn]
}