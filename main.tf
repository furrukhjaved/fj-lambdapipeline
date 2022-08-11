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
  source = "./modules/pipeline"
}

