module "global_variables" {
  source = "../global"
}

data "aws_iam_policy" "codebuild-access-to-s3" {
  arn = "arn:aws:iam::${module.global_variables.account_id}:policy/${module.global_variables.env}-lambda-builds-s3"
}

# Creating codebuild service role assume policy
data "aws_iam_policy_document" "codebuild_service_role_assume_policy" {
  statement {
    sid     = "codebuild-assume"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

# Creating codebuild service role base policy
data "aws_iam_policy_document" "codebuild_role_base_policy" {
  statement {
    sid    = "CloudWatch"
    effect = "Allow"

    resources = [
      "arn:aws:logs:eu-west-1:${module.global_variables.account_id}:log-group:/aws/codebuild/${module.global_variables.name_prefix}",
      "arn:aws:logs:eu-west-1:${module.global_variables.account_id}:log-group:/aws/codebuild/${module.global_variables.name_prefix}:*",
    ]

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
  }

  statement {
    sid       = ""
    effect    = "Allow"
    resources = ["arn:aws:s3:::codepipeline-eu-west-1-*"]

    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketAcl",
      "s3:GetBucketLocation",
    ]
  }

  statement {
    sid       = "CodeBuild"
    effect    = "Allow"
    resources = ["arn:aws:codebuild:eu-west-1:${module.global_variables.account_id}:report-group/${module.global_variables.name_prefix}-*"]

    actions = [
      "codebuild:CreateReportGroup",
      "codebuild:CreateReport",
      "codebuild:UpdateReport",
      "codebuild:BatchPutTestCases",
      "codebuild:BatchPutCodeCoverages",
    ]
  }
}

# Creating additional policies to grant access on other resources to codebuild service role
data "aws_iam_policy_document" "codebuild_access_to_lambda" {
  statement {
    sid       = "Update lambda"
    effect    = "Allow"
    resources = ["arn:aws:lambda:eu-west-1:${module.global_variables.account_id}:function:${module.global_variables.name_prefix}"]
    actions   = ["lambda:UpdateFunctionCode"]
  }
}

data "aws_iam_policy_document" "codebuild_access_to_s3" {
  depends_on = [data.aws_iam_policy.codebuild-access-to-s3]
  statement {
    sid       = "List buckets"
    effect    = "Allow"
    resources = ["arn:aws:s3:::${module.global_variables.env}-lambda-builds"]

    actions = [
      "s3:ListBucketMultipartUploads",
      "s3:ListBucket",
    ]
  }

  statement {
    sid       = "upload to s3"
    effect    = "Allow"
    resources = ["arn:aws:s3:::${module.global_variables.env}-lambda-builds/*"]

    actions = [
      "s3:*Object",
      "s3:AbortMultipartUpload",
      "s3:ListMultipartUploadParts",
    ]
  }
}