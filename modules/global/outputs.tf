output "name_prefix" {
  value = local.name_prefix
}

output "env" {
  value = var.env[local.name_prefix]
}

output "account_id" {
  value = var.account_id[local.env[0]]
}


output "AWS_DEFAULT_REGION" {
  value = var.AWS_DEFAULT_REGION
}

output "public_subnet_ids" {
  value = var.public_subnet_ids[local.env[0]]
}

output "private_subnet_ids" {
  value = var.private_subnet_ids[local.env[0]]
}

output "default_vpc_id" {
  value = var.default_vpc_id[local.env[0]]
}

output "environment_vars_type" {
  value = var.environment_vars_type
}


output "app_count" {
  value = var.app_count
}

output "db_name" {
  value = var.db_name[local.env[0]]
}
