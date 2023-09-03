# Base
variable "region_name" {
  type = string
}

# Tags
variable "tags" {
  type = map(string)
}

variable "default_tags" {
  type = map(string)
}

# Data
variable "data" {
  type = list(object({
    vpc_id = string
    tags   = map(string)
  }))
}