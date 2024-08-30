output "cluster_name" {
  description = "The name of the Kubernetes cluster"
  value       = google_container_cluster.primary.name
}

output "kubeconfig" {
  description = "Kubernetes configuration file content to access the cluster"
  value       = google_container_cluster.primary.endpoint
}

