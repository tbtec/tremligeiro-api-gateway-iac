resource "aws_api_gateway_rest_api" "main" {
   name = "api-gateway-tremligeiro"
   endpoint_configuration {
     types = ["REGIONAL"]
   }
 }