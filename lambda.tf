# data "aws_iam_policy_document" "assume_role" {
#   statement {
#     effect = "Allow"

#     principals {
#       type        = "Service"
#       identifiers = ["lambda.amazonaws.com"]
#     }

#     actions = ["sts:AssumeRole"]
#   }
# }

# resource "aws_iam_role" "role-for-lambda" {
#   name               = "Role-for-lambda"
#   assume_role_policy = data.aws_iam_policy_document.assume_role.json
# }
#

# resource "aws_lambda_function" "test_lambda" {
#   # If the file is not in the current working directory you will need to include a
#   # path.module in the filename.
#   function_name = "lambda-from-terraform"
#   role          = aws_iam_role.role-for-lambda.arn
#   image_uri = aws_ecr_repository.repo.id
 

# }