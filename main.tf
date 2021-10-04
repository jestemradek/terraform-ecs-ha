terraform {
  required_version = ">= 1.0.8"
  backend "s3" {
    bucket = "terraform-db-jestemradek"
    key    = "terraform-ecs-cluster.tfstate"
    region = "us-west-1"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "ecs" {
  source = "./modules/ecs"

  environment           = var.environment
  cluster               = var.environment
  service               = var.environment
  container_name        = var.container_name
  container_port        = var.container_port
  container_definitions = file("container_definition.json")
  cloudwatch_prefix     = var.environment #See ecs_instances module when to set this and when not!
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  availability_zones    = var.availability_zones
  max_size              = var.max_size
  min_size              = var.min_size
  desired_capacity      = var.desired_capacity
  instance_type         = var.instance_type
  ecs_aws_ami           = var.aws_ecs_ami
  ecs_task_family       = var.ecs_task_family
}
