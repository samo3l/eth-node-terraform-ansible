variable "aws_region" {
  description = "AWS region"
  default     = "eu-west-2"
}

variable "subnet_id" {
  description = "AWS VPC subnet id"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
}

variable "ssh_key_name" {
  description = "SSH key pair name"
}

variable "volume_size" {
  description = "EC2 instance disk size"
  default     = 1000 //GB
}