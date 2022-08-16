resource "aws_codebuild_project" "codebuild_project_template" {
  name          = var.project_name
  build_timeout = "5"
  service_role  = var.service_role

  artifacts {
    type = var.artifacts_type
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = var.environment_image
    type                        = "LINUX_CONTAINER"
    privileged_mode             = true
    image_pull_credentials_type = "CODEBUILD"

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

  source {
    type      = var.source_type
    buildspec = var.buildspec
  }
  source_version = ""
}


