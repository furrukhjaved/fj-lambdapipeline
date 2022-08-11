module "global_variables" {
  source = "../global"
}

data "aws_iam_policy" "codebuild-access-to-s3" {
  arn = "arn:aws:iam::${module.global_variables.account_id}:policy/${module.global_variables.env}-lambda-builds-s3"
}