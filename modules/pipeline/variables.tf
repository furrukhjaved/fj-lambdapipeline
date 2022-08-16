variable "stages" {
  type = list(object({
    type     = string
    name     = string
    provider = string
    config    = map(string)
    inputs   = list(string)
    outputs  = list(string)
  }))
  default = []
}