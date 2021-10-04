resource "aws_ecs_service" "ecs_service" {
  name            = var.service
  cluster         = var.cluster_id
  task_definition = aws_ecs_task_definition.ecs_task.arn
  desired_count   = var.desired_capacity
  launch_type     = var.launch_type
  iam_role        = aws_iam_role.ec2_role.arn

  depends_on = [aws_iam_policy_attachment.policy-attachment]

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }
  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
}

resource "aws_ecs_task_definition" "ecs_task" {
  family                = var.ecs_task_family
  container_definitions = var.container_definitions
}

resource "aws_iam_policy" "policy" {
  name        = var.iam_policy_name
  description = "ec2 default policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "policy-attachment" {
  name       = "policy-attachment"
  roles      = ["${aws_iam_role.ec2_role.name}"]
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_role" "ec2_role" {
  name = var.iam_role

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "ec2.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
