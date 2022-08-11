module "global_variables" {
  source = "../global"
}

data "aws_vpc" "main" {
  id = module.global_variables.default_vpc_id
}

data "aws_subnet" "public" {
  count = length(module.global_variables.public_subnet_ids)
  id = tolist(module.global_variables.public_subnet_ids)[count.index]
}

data "aws_subnet" "private" {
  count = length(module.global_variables.private_subnet_ids)
  id = tolist(module.global_variables.private_subnet_ids)[count.index]
}