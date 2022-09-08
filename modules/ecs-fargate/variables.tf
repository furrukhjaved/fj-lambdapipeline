variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = "80"
}

variable "app_count" {
  description = "Number of docker containers to run"
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "256"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "512"
}

variable "alb_certificate_arn" {
  description = "The certificate ARN for the application load balancer"
  default     = "arn:aws:acm:eu-west-1:397446452146:certificate/2a2915d8-02a5-4702-bc6d-df4e153fea80"
}

variable "ecs_service_name" {}
variable "ecs_container_name" {}

variable "health_check_path" {
  description = "define the health check path here e.g. /, /login, /health"
  default     = "/"
}

locals {
  app_image = module.global_variables.name_prefix
}