output "instance_id" {
  description = "ID of the VM instance"
  value       = google_compute_instance.this.id
}

output "external_ip" {
  description = "External IP of the VM instance"
  value       = google_compute_instance.this.network_interface[0].access_config[0].nat_ip
}
