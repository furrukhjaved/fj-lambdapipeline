variable "iam_policy_arns" {
  description = "list of all policies to be attached to the codebuide service role"
  type        = list(any)
  default = []
}