module "global_variables" {
  source = "./modules/global"
}

/*
module "api" {
  source = "./api"
}
*/


#module "data" {
#  source = "modules/pipeline/data"
#}

module "network" {
  source = "./modules/pipeline/network"
}

module "pipeline" {
  source = "./modules/pipeline"
  artifacts_type = "CODEPIPELINE"
  source_type = "CODEPIPELINE"
  environment_variable = [
    {
      name  = "AWS_ACCOUNT_ID"
      value = module.global_variables.account_id
      type  = module.global_variables.environment_vars_type
    },
    {
      name  = "IMAGE_REPO_NAME"
      value = module.global_variables.name_prefix
      type  = module.global_variables.environment_vars_type
    },
    {
      name  = "REPOSITORY_URI"
      value = "${module.global_variables.account_id}.dkr.ecr.${module.global_variables.AWS_DEFAULT_REGION}.amazonaws.com/${module.global_variables.name_prefix}"           # Either reference a resource or fetch via data source
      type  = module.global_variables.environment_vars_type
    }
  ]
}