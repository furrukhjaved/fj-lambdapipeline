resource "aws_ecr_repository" "ecr_repo" {
  name = module.global_variables.name_prefix
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository_policy" "policy" {
  repository = aws_ecr_repository.ecr_repo.name
  policy     = module.policies.ecr_role_policy
}