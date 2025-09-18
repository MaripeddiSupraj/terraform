resource "google_compute_instance" "this" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = "default"
    # Remove access_config to disable public IP
  }

  metadata = {
    block-project-ssh-keys = "true"
  }

  shielded_instance_config {
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  labels = {
    environment = var.environment
  }
}
