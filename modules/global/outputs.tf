output "name_prefix" {
  value = var.name_prefix[terraform.workspace]
}

output "account_id" {
  value = var.account_id[terraform.workspace]
}

output "env" {
  value = var.env[terraform.workspace]
}

output "AWS_DEFAULT_REGION" {
  value = var.AWS_DEFAULT_REGION
}

output "public_subnet_ids" {
  value = var.public_subnet_ids[terraform.workspace]
}

output "private_subnet_ids" {
  value = var.private_subnet_ids[terraform.workspace]
}

output "default_vpc_id" {
  value = var.default_vpc_id[terraform.workspace]
}

#
#output "artifacts_type" {
#  value = var.artifacts_type
#}
#
#output "source_type" {
#  value = var.source_type
#}
#
#output "buildspec" {
#  description = "buildspec path"
#  value       = var.buildspec[terraform.workspace]
#}
#
#output "environment_image" {
#  description = "aws/codebuild/standard:5.0"
#  value       = var.environment_image
#}
#
output "environment_vars_type" {
  value = var.environment_vars_type
}

#output "environment_variables" {
#  description = "Add the environment vars for codebuild"
#  value = var.environment_variables
#}


output "app_count" {
  value = var.app_count
}

output "db_name" {
  value = var.db_name[terraform.workspace]
}


/*output "cloudfront_certificate_arn" {
  value = var.cloudfront_certificate_arn
}*/

/*output "alb_certificate_arn" {
  value = var.alb_certificate_arn
}*/