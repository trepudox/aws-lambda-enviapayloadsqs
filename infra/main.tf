resource "aws_iam_policy" "lambda_policy" {
  name = "${var.lambda_function_name}-policy"
  policy = file("${path.module}/iam/policy.json")
}

resource "aws_iam_role" "lambda_role" {
  name                = "${var.lambda_function_name}-role"
  assume_role_policy  = file("${path.module}/iam/role.json")
  managed_policy_arns = [aws_iam_policy.lambda_policy.arn]
}

data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "${path.module}/../app"
  output_path = "${path.module}/../out/${var.lambda_function_name}.zip"
}

resource "aws_lambda_function" "lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "${path.module}/../out/${var.lambda_function_name}.zip"
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn

  runtime = var.lambda_runtime
  handler = var.lambda_handler

  source_code_hash = data.archive_file.lambda.output_base64sha256

  # environment {
  #   variables = {
  #     foo = "bar"
  #   }
  # }
}