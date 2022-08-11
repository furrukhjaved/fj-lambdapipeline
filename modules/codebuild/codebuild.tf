resource "aws_codebuild_project" "codebuild_project_template" {
  name          = var.project_name
  build_timeout = "5"
  service_role  = module.policies.codebuild-service-role

  source {
    type      = var.source_type
    #buildspec = var.buildspec
  }
  source_version = ""

  artifacts {
    type = var.artifacts_type
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = var.environment_image
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true
    image_pull_credentials_type = "CODEBUILD"

    #    dynamic "environment_variable" {
    #      for_each = module.global_variables.environment_variable
    #      content {
    #          name  = environment_variable.value.name
    #          value = environment_variable.value.value
    #          type  = environment_variable.value.type
    #        }
    #      }
    #    }

    # Environment variables
    dynamic "environment_variable" {
      for_each = var.environment_variables
      content {
        name  = environment_variable.value.name
        value = environment_variable.value.value
        type  = environment_variable.value.type
      }
    }
  }

    logs_config {
      cloudwatch_logs {
        status = "ENABLED"
        #      group_name  = "log-group"
        #      stream_name = "log-stream"
      }

      s3_logs {
        status = "DISABLED"
      }
    }
}


