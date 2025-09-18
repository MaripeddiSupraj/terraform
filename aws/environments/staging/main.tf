terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
  backend "s3" {
    # Configure in terraform init
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr    = "10.0.0.0/16"
  environment = var.environment
}

module "ec2" {
  source = "../../modules/ec2"

  instance_name = "${var.environment}-web-server"
  environment   = var.environment
}

module "s3" {
  source = "../../modules/s3"

  bucket_name = "${var.environment}-app-bucket-${random_id.bucket_suffix.hex}"
  environment = var.environment
}

module "sns" {
  source = "../../modules/sns"

  topic_name  = "${var.environment}-notifications"
  environment = var.environment
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}
