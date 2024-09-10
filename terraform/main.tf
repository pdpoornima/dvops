provider "google" {
  credentials = file(var.credentials_file)
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
