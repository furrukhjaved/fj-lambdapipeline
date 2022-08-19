locals {
  codestar_connection_arn = (
    module.global_variables.env == "Production" ? "arn:aws:codestar-connections:eu-west-1:397446452146:connection/c0ed4773-7ecc-45fb-83e7-d92c1cd9b110" :
    (module.global_variables.env == "UAT" ? "arn:aws:codestar-connections:eu-west-1:397446452146:connection/c0ed4773-7ecc-45fb-83e7-d92c1cd9b110" :
      "arn:aws:codestar-connections:eu-west-1:764895352979:connection/7e08c051-cf6a-4abe-ac54-c09d1b14a484"
    )
  )
}

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

module "pipeline" {
  source                  = "./modules/pipeline"
  codestar_connection_arn = local.codestar_connection_arn
  repo_name               = "fj-pipeline-repo"
}

