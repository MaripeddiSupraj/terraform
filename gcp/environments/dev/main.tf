terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  backend "gcs" {
    # Configure in terraform init
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "vm" {
  source = "../../modules/vm"

  instance_name = "${var.environment}-web-server"
  environment   = var.environment
}

module "storage" {
  source = "../../modules/storage"

  bucket_name = "${var.project_id}-${var.environment}-app-bucket-${random_id.bucket_suffix.hex}"
  environment = var.environment
}

module "pubsub" {
  source = "../../modules/pubsub"

  topic_name    = "${var.environment}-notifications"
  environment   = var.environment
  subscriptions = ["${var.environment}-sub"]
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}
