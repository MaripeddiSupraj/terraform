variable "bucket_name" {
  description = "Name of the storage bucket"
  type        = string
}

variable "location" {
  description = "Location for the storage bucket"
  type        = string
  default     = "US"
}

variable "versioning_enabled" {
  description = "Enable versioning for the storage bucket"
  type        = bool
  default     = true
}

variable "environment" {
  description = "Environment name"
  type        = string
}
