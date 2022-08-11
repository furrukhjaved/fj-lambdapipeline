# Creating codebuild service role
resource "aws_iam_role" "codebuild-service-role" {
  assume_role_policy = data.aws_iam_policy_document.codebuild-service-role-policy.json
  name = "codebuild-${module.global_variables.name_prefix}-role"
}


# Creating codebuild service role assume policy
data "aws_iam_policy_document" "codebuild-service-role-policy" {
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
data "aws_iam_policy_document" "codebuild-role-base-policy" {
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
data "aws_iam_policy_document" "codebuild-access-to-lambda" {
  statement {
    sid       = "Update lambda"
    effect    = "Allow"
    resources = ["arn:aws:lambda:eu-west-1:${module.global_variables.account_id}:function:${module.global_variables.name_prefix}"]
    actions   = ["lambda:UpdateFunctionCode"]
  }
}

data "aws_iam_policy_document" "codebuild-access-to-s3" {
  depends_on = [data.aws_iam_policy.codebuild-access-to-s3]
  statement {
    sid       = "VisualEditor0"
    effect    = "Allow"
    resources = ["arn:aws:s3:::${module.global_variables.env}-lambda-builds"]
    
    actions = [
      "s3:ListBucketMultipartUploads",
      "s3:ListBucket",
    ]
  }
  
  statement {
    sid       = "VisualEditor1"
    effect    = "Allow"
    resources = ["arn:aws:s3:::${module.global_variables.env}-lambda-builds/*"]
    
    actions = [
      "s3:*Object",
      "s3:AbortMultipartUpload",
      "s3:ListMultipartUploadParts",
    ]
  }
}