# terraform-ecs-ha


unsolved issue:

module.ecs.module.ecs_service.aws_ecs_service.ecs_service: Still creating... [3m20s elapsed]
module.ecs.module.ecs_service.aws_ecs_service.ecs_service: Still creating... [3m30s elapsed]
module.ecs.module.ecs_service.aws_ecs_service.ecs_service: Still creating... [3m40s elapsed]
module.ecs.module.ecs_service.aws_ecs_service.ecs_service: Still creating... [3m50s elapsed]
╷
│ Error: error creating prod service: InvalidParameterException: Unable to assume role and validate the specified targetGroupArn. Please verify that the ECS service role being passed has the proper permissions.
│
│   with module.ecs.module.ecs_service.aws_ecs_service.ecs_service,
│   on modules/ecs_service/main.tf line 1, in resource "aws_ecs_service" "ecs_service":
│    1: resource "aws_ecs_service" "ecs_service" {
