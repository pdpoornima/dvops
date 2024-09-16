terraform {
  backend "gcs" {
    bucket = "mybuildbucket"
    prefix = "terraform/state"
  }
}
provider "google" {
  
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
resource "google_artifact_registry_repository" "docker_repo" {
  provider    = google
  location    = var.region
  repository_id = "my-artifact-repo"
  format      = "DOCKER"
}
