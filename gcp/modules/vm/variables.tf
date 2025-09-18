variable "instance_name" {
  description = "Name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the VM"
  type        = string
  default     = "e2-micro"
}

variable "zone" {
  description = "Zone for the VM instance"
  type        = string
  default     = "us-central1-a"
}

variable "image" {
  description = "Boot disk image"
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "environment" {
  description = "Environment name"
  type        = string
}
