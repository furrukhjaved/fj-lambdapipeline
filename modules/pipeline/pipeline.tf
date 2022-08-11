module "global_variables" {
  source = "../global"
  artifacts_type = "CODEPIPELINE"
  source_type = "CODEPIPELINE"
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
  source = "../pipeline/network"
}

module "codebuild" {
  source = "../pipeline/codebuild"
}