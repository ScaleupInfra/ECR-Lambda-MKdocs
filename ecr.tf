resource "aws_ecr_repository" "repo" {
  name                 = "my-public-repo"
  image_tag_mutability = "MUTABLE"


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