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

output "environment_vars_type" {
  value = var.environment_vars_type
}


output "app_count" {
  value = var.app_count
}

output "db_name" {
  value = var.db_name[terraform.workspace]
}
