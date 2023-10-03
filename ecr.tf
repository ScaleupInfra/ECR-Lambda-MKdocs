resource "aws_ecr_repository" "repo" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "MUTABLE"


  # provisioner "local-exec" {
  #   working_dir = "${path.module}/mkdocs"
  #   command = <<EOT
  #   "aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${var.account_id}.dkr.ecr.${var.region}.amazonaws.com"
  #   "docker build -t ${var.ecr_repo_name} ."
  #   "docker tag ${var.ecr_repo_name}:latest ${var.account_id}.dkr.ecr.${var.region}.amazonaws.com/${var.ecr_repo_name}:latest"
  #   "docker push ${var.account_id}.dkr.ecr.${var.region}.amazonaws.com/${var.ecr_repo_name}:latest"
  #   EOT
    
  # }

}

output "repo22" {
  value = aws_ecr_repository.repo.name
  
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