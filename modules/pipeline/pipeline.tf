module "global_variables" {
  source = "../global"
}

module "network" {
  source = "../network"
}

module "policies" {
  source = "../policies"
}


module "codebuild" {
  depends_on     = [module.policies]
  source         = "../codebuild"
  project_name   = module.global_variables.name_prefix
  service_role   = module.policies.codebuild_service_role_arn
  artifacts_type = "CODEPIPELINE"
  source_type    = "CODEPIPELINE"
  buildspec      = "" # Add a filepath if required.
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
      type  = module.global_variables.environment_vars_type[0]
    }
  ]

}

resource "aws_codepipeline" "pipeline_template" {
  depends_on = [module.codebuild]
  name       = module.global_variables.name_prefix
  role_arn   = module.policies.codepipline_service_role_arn

  artifact_store {
    location = local.artifact_store
    type     = "S3"
  }

  dynamic "stage" {
    for_each = local.stages
    content {
      name = stage.value.name
      dynamic "action" {
        for_each = stage.value.action
        content {
          name             = action.value.name
          category         = action.value.category
          owner            = action.value.owner
          provider         = action.value.provider
          version          = action.value.version
          run_order        = action.value.run_order
          input_artifacts  = action.value.input_artifacts
          output_artifacts = action.value.output_artifacts
          configuration     = action.value.configuration
        }
      }
    }
  }
}
