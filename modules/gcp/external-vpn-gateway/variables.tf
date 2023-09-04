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
    name            = string
    redundancy_type = string
    interfaces      = list(string)
  }))
}


