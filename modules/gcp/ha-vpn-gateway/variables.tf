# Defaults
variable "region_name" {
  type = string
}

variable "project_name" {
  type = string
}

variable "credentials_filename" {
  type = string
}

# Data
variable "data" {
  type = list(object({
    name       = string
    stack_type = string
    network_id = string
  }))
}


