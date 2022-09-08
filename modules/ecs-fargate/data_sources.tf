module "global_variables" {
  source = "../global"
}

module "network" {
  source = "../network"
}

module "policies" {
  source = "../policies"
}


data "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"
}