terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.79.0"
    }
  }
}

provider "google" {
  project     = var.project_name
  region      = var.region_name
  credentials = "../../../credentials/${var.credentials_filename}"
}