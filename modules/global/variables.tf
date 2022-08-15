variable "app_count" {
  description = "How many ECS task instances we should run as part of the service"
  default     = 2
}

variable "account_id" {
  description = "AWS account IDs"
  type        = map(string)
  default = {
    fj-lambdapipeline-prd = "764895352979" #SIT - This needs to be replaced by Main acc's VPC eu-west-1
    fj-lambdapipeline-uat = "397446452146"
    fj-lambdapipeline-sit = "764895352979" #SIT
  }
}

variable "AWS_DEFAULT_REGION" {
  description = "Set at Workspace UI level"
  default     = ""
}

variable "name_prefix" {
  type        = map(string)
  description = "The prefix used before resource names"
  default = {
    fj-lambdapipeline-prd = "fj-lambdapipeline"
    fj-lambdapipeline-uat = "uat-fj-lambdapipeline"
    fj-lambdapipeline-sit = "sit-fj-lambdapipeline"
  }
}

variable "env" {
  type        = map(string)
  description = "The prefix used before resource names"
  default = {
    fj-lambdapipeline-prd = "Production"
    fj-lambdapipeline-uat = "UAT"
    fj-lambdapipeline-sit = "SIT"
  }
}

variable "default_vpc_id" {
  type = map(string)
  default = {
    fj-lambdapipeline-prd = "vpc-044dd3c34b06ad23a" #SIT - This needs to be replaced by Main acc's VPC eu-west-1
    fj-lambdapipeline-uat = "vpc-005e344a1d489c637" #Main acc - Stockholm
    fj-lambdapipeline-sit = "vpc-044dd3c34b06ad23a"
  }
}

variable "public_subnet_ids" {
  type = map(set(string))
  default = {
    fj-lambdapipeline-prd = [ #SIT - This needs to be replaced by Main acc's subnets eu-west-1
      "subnet-0986c494aa261014a",
      "subnet-0e2ba44ee01606bc4",
    "subnet-022e723b01c226385"]
    fj-lambdapipeline-uat = [ #Main acc - Stockholm
      "subnet-05ceca24b9864e6a6",
    "subnet-072445f95a89c86ec"]
    fj-lambdapipeline-sit = [ #SIT
      "subnet-0986c494aa261014a",
      "subnet-0e2ba44ee01606bc4",
    "subnet-022e723b01c226385"]
  }
}

variable "private_subnet_ids" {
  type = map(set(string))
  default = {
    fj-lambdapipeline-prd = [ #SIT - This needs to be replaced by Main acc's subnets eu-west-1
      "subnet-09c46bb2df17049ba",
      "subnet-0ecebcc8c6d7de714",
    "subnet-065bff409cd172c75"]
    fj-lambdapipeline-uat = [ #Main acc - Stockholm
      "subnet-05ceca24b9864e6a6",
    "subnet-072445f95a89c86ec"]
    fj-lambdapipeline-sit = [ #SIT
      "subnet-09c46bb2df17049ba",
      "subnet-0ecebcc8c6d7de714",
    "subnet-065bff409cd172c75"]
  }
}

#variable "artifacts_type" {
#  description = "Need to enter NO_ARTIFACTS or CODEPIPELINE"
#  default = ""
#}
#
#variable "source_type" {
#  description = "Need to enter CODEPIPELINE"
#  default = ""
#}
#
#variable "buildspec" {
#  type = map(string)
#  description = "buildspec path"
#  default = {
#    fj-lambdapipeline-prd = ""
#    fj-lambdapipeline-uat = ""
#    fj-lambdapipeline-sit = ""
#  }
#}

#variable "environment_image" {
#  description = "aws/codebuild/standard:5.0"
#  default = "aws/codebuild/standard:5.0"
#}
#
#variable "environment_vars_type" {
#  description = "Defines the env var type i.e. PLAINTEXT or PARAMETER_STORE"
#  type = list(string)
#  default = ["PLAINTEXT", "SECRETS_MANAGER", "PARAMETER_STORE"]
#}
#
#variable "environment_variables" {
#  type = list(any)
#  description = "Add the environment vars for codebuild"
#  default = []
#}

variable "environment_vars_type" {
  description = "Defines the env var type i.e. PLAINTEXT or PARAMETER_STORE"
  type        = list(string)
  default     = ["PLAINTEXT", "SECRETS_MANAGER", "PARAMETER_STORE"]
}

variable "db_name" {
  type = map(string)
  default = {
    fj-lambdapipeline-prd = "fj-lambdapipelinedb"
    fj-lambdapipeline-uat = "uat-fj-lambdapipelinedb"
    fj-lambdapipeline-sit = "sit-fj-lambdapipelinedb"
  }
}



/*
variable "alb_certificate_arn" {
  description = "The certificate ARN for the application load balancer"
  default     = "arn:aws:acm:eu-west-1:397446452146:certificate/a25f0acc-e131-47d6-8ce9-d9cbc8993f0d"
}

variable "cloudfront_certificate_arn" {
  description = "The certificate ARN for the cloudfront distribution"
  default     = "arn:aws:acm:us-east-1:397446452146:certificate/f76eb315-f181-4ef8-b42d-56653f0b3d00"
}
*/



