resource "aws_api_gateway_deployment" "main" {
  rest_api_id = aws_api_gateway_rest_api.main.id

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_api_gateway_integration.integration_lambda_login,
  ]
}

resource "aws_api_gateway_stage" "example" {
  deployment_id = aws_api_gateway_deployment.main.id
  rest_api_id   = aws_api_gateway_rest_api.main.id
  stage_name    = "dev"
}

  resource "aws_api_gateway_deployment" "deployment_app" {
  rest_api_id = aws_api_gateway_rest_api.app.id

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_api_gateway_integration.integration_lambda_login,
  ]
}

resource "aws_api_gateway_stage" "stage_app" {
  deployment_id = aws_api_gateway_deployment.deployment_app.id
  rest_api_id   = aws_api_gateway_rest_api.app.id
  stage_name    = "dev"
}