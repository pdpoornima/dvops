variable "project_id" {
  description = "The ID of the GCP project"
  type        = string
  default     = "devops-433705"
}
variable "credentials_file" {
  description = "C:/Users/Poornima/Documents/service-account-key.json"
  type        = string
}

variable "region" {
  description = "The region where resources will be created"
  type        = string
  default     = "us-east5"
}

variable "zone" {
  description = "The zone within the region where resources will be created"
  type        = string
  default     = "us-east5-a"
}

variable "machine_type" {
  description = "The type of machine to use for the VM instance"
  type        = string
  default     = "e2-medium"
}