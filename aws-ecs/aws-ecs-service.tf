resource "aws_ecs_service" "my_ecs_service" {
  name            = var.ecs_service_name # Change this to your desired service name
  cluster         = aws_ecs_cluster.my_ecs_cluster.id
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  propagate_tags = "SERVICE"
  scheduling_strategy = "REPLICA"
  desired_count = 1
  launch_type = "FARGATE"
    network_configuration {
    subnets = [data.aws_subnets.default-subnets.ids[0],data.aws_subnets.default-subnets.ids[1]] # Change this to your subnet IDs
    security_groups = [aws_security_group.allow_traffic.id] # Change this to your security group IDs
    assign_public_ip = true
  }

  depends_on = [aws_ecs_task_definition.my_task_definition]
}


data "aws_subnets" "default-subnets" {
}