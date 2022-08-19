#output "buildspec" {
#  description = "buildspec path"
#  value       = var.buildspec[terraform.workspace]
#}

output "codebuild_project_name" {
  value = aws_codebuild_project.codebuild_project_template.name
}