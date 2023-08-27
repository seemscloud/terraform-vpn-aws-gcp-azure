terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.79.0"
    }
  }
}

provider "google" {
  region      = var.region_name
  credentials = "../../../credentials/${var.credentials_filename}"
}