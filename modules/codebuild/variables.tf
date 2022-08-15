variable "project_name" {}

variable "service_role" {
  description = "stores arn for the role"
  default     = ""
}

variable "artifacts_type" {
  description = "Need to enter NO_ARTIFACTS or CODEPIPELINE"
  default     = ""
}

variable "source_type" {
  description = "Need to enter CODEPIPELINE"
  default     = ""
}

variable "environment_image" {
  description = "aws/codebuild/standard:5.0"
  default     = "aws/codebuild/standard:5.0"
}

variable "buildspec" {
  description = "buildspec path"
}

variable "environment_variables" {
  type        = list(any)
  description = "Add the environment vars for codebuild"
  default     = []
}