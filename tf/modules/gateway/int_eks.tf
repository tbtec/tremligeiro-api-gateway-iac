# resource "aws_api_gateway_resource" "application" {
#   rest_api_id = aws_api_gateway_rest_api.app.id
#   parent_id   = aws_api_gateway_rest_api.app.root_resource_id
#   path_part   = "{proxy+}"
# }

# resource "aws_api_gateway_method" "application" {
#   rest_api_id   = aws_api_gateway_rest_api.app.id
#   resource_id   = aws_api_gateway_resource.application.id
#   http_method   = "ANY"
#   authorization = "NONE"

#   request_parameters = {
#     "method.request.path.proxy" = true
#   }
#  }

# # resource "aws_api_gateway_method_response" "application" {
# #   rest_api_id = aws_api_gateway_rest_api.app.id
# #   resource_id = aws_api_gateway_resource.application.id
# #   http_method = aws_api_gateway_method.application.http_method
# #   status_code = "200"

# #   response_parameters = {
# #     "method.response.header.Access-Control-Allow-Headers" = true,
# #     "method.response.header.Access-Control-Allow-Methods" = true,
# #     "method.response.header.Access-Control-Allow-Origin"  = true
# #   }
# # }

# # resource "aws_api_gateway_integration_response" "application" {
# #   rest_api_id = aws_api_gateway_rest_api.app.id
# #   resource_id = aws_api_gateway_resource.application.id
# #   http_method = aws_api_gateway_method.application.http_method
# #   status_code = aws_api_gateway_method_response.application.status_code

# #   response_parameters = {
# #     "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,X-Api-Key,X-Amz-Security-Token'",
# #     "method.response.header.Access-Control-Allow-Methods" = "'GET,POST,PUT,DELETE,OPTIONS'",
# #     "method.response.header.Access-Control-Allow-Origin"  = "'*'"
# #   }

# #   depends_on = [
# #     aws_api_gateway_method.application,
# #   ]
# # }

# resource "aws_api_gateway_integration" "application" {
#   rest_api_id = aws_api_gateway_rest_api.app.id
#   resource_id = aws_api_gateway_resource.application.id
#   http_method = "ANY"

#   integration_http_method = "ANY"
#   type                    = "HTTP_PROXY"
#   uri                     = "http://${data.aws_lb.nlb.dns_name}/{proxy}"
#   passthrough_behavior    = "WHEN_NO_MATCH"
#   #content_handling        = "CONVERT_TO_TEXT"

#    request_parameters = {
#       "integration.request.path.proxy"           = "method.request.path.proxy"
#   }

#   connection_type = "VPC_LINK"
#   connection_id   = aws_api_gateway_vpc_link.main.id
# }