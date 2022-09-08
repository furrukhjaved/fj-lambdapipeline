data "aws_iam_policy_document" "ecr_role_policy" {
  statement {
    sid    = ""
    effect = "Allow"

    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
    ]

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

# Creating IAM policies through data sources
resource "aws_iam_policy" "ecr_role_policy" {
  policy = data.aws_iam_policy_document.ecr_role_policy.json
  name   = "ecr-${module.global_variables.name_prefix}-policy}"
}