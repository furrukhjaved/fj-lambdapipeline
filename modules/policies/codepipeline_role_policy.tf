# Creating IAM policies through data sources
resource "aws_iam_policy" "codepipeline_service_role_policies" {
  count  = length(local.codepipeline_iam_policy_json)
  policy = local.codepipeline_iam_policy_json[count.index]
  name   = "codepipeline-${module.global_variables.name_prefix}-${var.codepipeline_iam_policy_names[count.index]}"
}

# Creating codepipeline service role
resource "aws_iam_role" "codepipeline_service_role" {
  assume_role_policy = data.aws_iam_policy_document.codepipeline_role_assume_policy.json
  name               = "codepipeline-${module.global_variables.name_prefix}-role"
}


# Attaching the above policy to the service role

resource "aws_iam_role_policy_attachment" "codepipeline_service_role_policy_attachment" {
  depends_on = [aws_iam_policy.codepipeline_service_role_policies]
  role       = aws_iam_role.codepipeline_service_role.arn
  count      = length(aws_iam_policy.codepipeline_service_role_policies.*.arn)
  policy_arn = aws_iam_policy.codepipeline_service_role_policies.*.arn[count.index]
}