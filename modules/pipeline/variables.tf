variable "repo_name" {
  description = "Provide the name for the repo"
}

variable "codestar_connection_arn" {
  description = "Provide the codestar connection arn"
}

locals {
  artifact_store = (
    module.global_variables.env == "SIT" ?
    "codepipeline-eu-west-1-136679055017" :
    "codepipeline-eu-west-1-757399681483" # For UAT/PROD
  )
}


locals {
  stages = [
    {
      name = "Source"
      action = [
        {
          run_order        = 1
          category         = "Source"
          name             = "Source"
          owner            = "ThirdParty"               # "AWS", "ThirdParty" for Github/Bitbucket
          provider         = "CodeStarSourceConnection" # Other options = "GitHub", "Bitbucket", "CodeCommit"
          version          = "2"
          input_artifacts  = []
          output_artifacts = ["SourceArtifacts"]
          configuration = {
            ConnectionArn = var.codestar_connection_arn
            BranchName = (
              module.global_variables.env == "Production" ?
              "master" :
              (module.global_variables.env == "UAT" ?
                "develop" :
                "sit"
              )
            )
            # OutputArtifactFormat = "CODEBUILD_CLONE_REF"
            RepositoryName = var.repo_name
            ProjectName    = null
          }
        }
      ]
      }, {
      name = "Build"
      action = [
        {
          run_order        = 2
          category         = "Build"
          name             = "Build"
          owner            = "AWS"
          provider         = "CodeBuild"
          version          = "1"
          input_artifacts  = ["SourceArtifacts"]
          output_artifacts = ["BuildArtifact"]
          configuration = {
            #            BranchName           = null
            #            OutputArtifactFormat = null
            #            RepositoryName       = null
            ProjectName = module.codebuild.codebuild_project_name
          }
        }
      ]
    }
  ]
}


# Manual approval action

#{
#run_order        = 3
#category         = "Approval"
#name             = "Approve"
#owner            = "AWS"
#provider         = "Manual"
#version          = "1"
#input_artifacts  = []
#output_artifacts = []
#configuration    = {
#BranchName           = null
#OutputArtifactFormat = null
#RepositoryName       = null
#ProjectName          = null
#}
#}
