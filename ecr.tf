resource "aws_ecr_repository" "repo" {
  name                 = "my-public-repo"
  image_tag_mutability = "MUTABLE"

  # provisioner "local-exec" {
  #   working_dir = "${path.module}/../mkdocs/"
  #   command = <<EOT
  #   "aws ecr get-login-password --region ${var.region}| docker login --username AWS --password-stdin ${var.account_id}.dkr.ecr.${var.region}.amazonaws.com"
  #   "docker build -t ${self.registry_id} ."
  #   "docker tag my-first-ecr-using-console:latest ${var.account_id}.dkr.ecr.${var.region}.amazonaws.com/${self.registry_id}:latest"
  #   "docker push ${var.account_id}.dkr.ecr.${var.region}.amazonaws.com/${self.registry_id}:latest"
  # EOT
  
  # }
}


data "aws_ecr_repository" "name" {
  name = aws_ecr_repository.repo.name
  
}
data "aws_ecr_image" "service_image" {
  repository_name = data.aws_ecr_repository.name.name
  image_tag       = "latest"
}
output "repo_name" {
  value = data.aws_ecr_repository.name.name
  
}


resource "aws_ecr_repository_policy" "policy" {
  /* name        = "my-public-repo-policy" */
  repository  = aws_ecr_repository.repo.name

  policy = jsonencode({
    Version = "2008-10-17",
    Statement = [
      {
        Sid       = "AllowPull",
        Effect    = "Allow",
        Principal = "*",
        Action    = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetRepositoryPolicy",
          "ecr:DescribeRepositories",
          "ecr:ListImages",
          "ecr:GetImage",
          "ecr:GetObject",
        ],
      },
    ],
  })



  
}