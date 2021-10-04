variable "launch_type" {
  description = "The launch type of instance"
  default     = "EC2"
}

variable "iam_policy_name" {
  description = "IAM Policy Name"
}

variable "iam_role" {
  description = " IAM Role Name"
}

variable "service" {
  description = "Service Name"
}

variable "cluster_id" {
  description = "Cluster ID"
}

variable "desired_capacity" {
  description = "The desired capacity of the cluster"
}

variable "container_name" {
  description = "Container Name"
}

variable "container_port" {
  description = "Container port"
}

variable "container_definitions" {
  description = "Container definitions"
}

variable "ecs_task_family" {
  description = "Container definitions"
}


variable "target_group_arn" {
  description = "TargetGroup ARN"
}
