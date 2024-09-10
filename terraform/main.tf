terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0.1"  # Adjust this version based on your requirements
    }
  }

  required_version = ">= 1.9.5"  # Ensure this matches the version in Cloud Build
}
provider "google" {
  credentials = file("C:/Users/Poornima/Documents/service-account-key.json")
  project     = var.project_id
  region      = var.region
}

resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = var.zone

  node_pool {
    name       = "default-pool"
    node_count = 3

    node_config {
      machine_type = var.machine_type
      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform",
      ]
    }
  }
}
