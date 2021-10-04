variable "environment" {
  description = "A name to describe the environment we're creating."
  default     = "prod"
}
variable "aws_profile" {
  description = "The AWS-CLI profile for the account to create resources in."
  default     = "default"
}
variable "aws_region" {
  description = "The AWS region to create resources in."
  default     = "us-west-1"
}
variable "aws_ecs_ami" {
  description = "The AMI to seed ECS instances with."
  default     = "ami-0432f87ba2fb5a0da"
}
variable "vpc_cidr" {
  description = "The IP range to attribute to the virtual network."
  default     = "10.0.0.0/16"
}
variable "public_subnet_cidrs" {
  description = "The IP ranges to use for the public subnets in your VPC."
  type        = list(any)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
variable "private_subnet_cidrs" {
  description = "The IP ranges to use for the private subnets in your VPC."
  type        = list(any)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}
variable "availability_zones" {
  description = "The AWS availability zones to create subnets in."
  type        = list(any)
  default     = ["us-west-1a", "us-west-1c"]
}
variable "max_size" {
  description = "Maximum number of instances in the ECS cluster."
  default     = 4
}
variable "min_size" {
  description = "Minimum number of instances in the ECS cluster."
  default     = 2
}
variable "desired_capacity" {
  description = "Ideal number of instances in the ECS cluster."
  default     = 2
}
variable "instance_type" {
  description = "Size of instances in the ECS cluster."
  default     = "t3.micro"
}

variable "container_port" {
  description = "Container port"
  default     = 80
}

variable "container_name" {
  description = "Container port"
  default     = "proxy-container"
}

variable "ecs_task_family" {
  description = "Container port"
  default     = "proxy"
}

