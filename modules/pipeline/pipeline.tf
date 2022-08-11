module "global_variables" {
  source = "../global"
}

module "network" {
  source = "../network"
}


module "build" {
  source = "../codebuild"
  project_name = module.global_variables.name_prefix
  artifacts_type = "CODEPIPELINE"
  source_type = "CODEPIPELINE"
    environment_variables = [
      {
        name  = "AWS_ACCOUNT_ID"
        value = module.global_variables.account_id
        type  = module.global_variables.environment_vars_type[0]
      },
      {
        name  = "IMAGE_REPO_NAME"
        value = module.global_variables.name_prefix
        type  = module.global_variables.environment_vars_type[0]
      },
      {
        name  = "REPOSITORY_URI"
        value = "${module.global_variables.account_id}.dkr.ecr.${module.global_variables.AWS_DEFAULT_REGION}.amazonaws.com/${module.global_variables.name_prefix}"
        # Either reference a resource or fetch via data source
        type  = module.global_variables.environment_vars_type[0]
      }
    ]

}