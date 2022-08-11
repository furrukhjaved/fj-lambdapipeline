resource "aws_codebuild_project" "codebuild_project_template" {
  name          = "test-project"
  description   = "test_codebuild_project"
  build_timeout = "5"
  service_role  = module.policies.codebuild-service-role
  
  source {
    type            = module.global_variables.source_type
    buildspec       = module.global_variables.buildspec
  }
  source_version = ""
  
  artifacts {
    type = module.global_variables.artifacts_type
  }
  
  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = module.global_variables.environment_image
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true
    image_pull_credentials_type = "CODEBUILD"
    
    dynamic "environment_variable" {
      for_each = module.global_variables.environment_variable
      content {
          name  = environment_variable.value.name
          value = environment_variable.value.value
          type  = environment_variable.value.type
        }
      }
    }
  
  logs_config {
    cloudwatch_logs {
      status  = "ENABLED"
      #      group_name  = "log-group"
      #      stream_name = "log-stream"
    }
    
    s3_logs {
      status   = "DISABLED"
    }
  }

}
