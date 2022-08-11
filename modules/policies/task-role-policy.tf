# Creating policy for the policy data sources

resource "aws_iam_policy" "codebuild_role_base_policy" {
  policy = data.aws_iam_policy_document.codebuild_role_base_policy.json
}

resource "aws_iam_policy" "codebuild_access_to_s3" {
  policy = data.aws_iam_policy_document.codebuild_access_to_s3.json
}

resource "aws_iam_policy" "codebuild_access_to_lambda" {
  policy = data.aws_iam_policy_document.codebuild_access_to_lambda.json
}

# Creating codebuild service role
resource "aws_iam_role" "codebuild_service_role" {
  assume_role_policy = data.aws_iam_policy_document.codebuild_service_role_assume_policy.json
  name = "codebuild-${module.global_variables.name_prefix}-role"
}


# Attaching the above policy to the service role

resource "aws_iam_role_policy_attachment" "codebuild_service_role_policy_attachment" {
  role       = aws_iam_role.codebuild_service_role
  count      = length(var.iam_policy_arns)
  policy_arn = var.iam_policy_arns[count.index]
}