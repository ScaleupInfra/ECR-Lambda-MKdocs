resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = var.task_family # Change this to your desired task family name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  memory =  "3072"
    cpu = "1024"

  execution_role_arn = aws_iam_role.ecs_execution_role.arn

  container_definitions = jsonencode([
    {
      name  = "my-container" # Change this to your desired container name
      image = "389210169880.dkr.ecr.us-east-1.amazonaws.com/my-public-repo:latest"
      portMappings = [
        {
          containerPort = 8000
          hostPort      = 8000
        }
      ] # Use the latest ECR image
    },
  ])
}