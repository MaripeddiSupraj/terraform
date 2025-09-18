variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c02fb55956c7d316" # Amazon Linux 2
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default     = []
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}
