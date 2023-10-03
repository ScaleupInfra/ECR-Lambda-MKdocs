resource "aws_ecs_cluster" "my_ecs_cluster" {
  name = var.ecs_cluster_name # Change this to your desired ECS cluster name
}
