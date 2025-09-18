output "project_id" {
  description = "GCP project ID"
  value       = var.project_id
}

output "region" {
  description = "GCP region"
  value       = var.region
}

output "environment" {
  description = "Environment name"
  value       = var.environment
}

output "vm_instance_id" {
  description = "VM instance ID"
  value       = module.vm.instance_id
}

output "storage_bucket_name" {
  description = "Storage bucket name"
  value       = module.storage.bucket_name
}

output "pubsub_topic_name" {
  description = "Pub/Sub topic name"
  value       = module.pubsub.topic_name
}
