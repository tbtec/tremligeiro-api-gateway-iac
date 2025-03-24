data "aws_lb" "nlb" {
   tags = {
    "kubernetes.io/service-name" : "kube-system/nginx-ingress-ingress-nginx-controller"
     #"service.k8s.aws/stack" : "ingress-nginx/ingress-nginx-controller"
   }
}

resource "aws_api_gateway_vpc_link" "main" {
  name        = "vpc-link-tremligeiro-eks-cluster"
  target_arns = [data.aws_lb.nlb.arn]
}

resource "aws_api_gateway_rest_api" "main" {
   name = "api-gateway-tremligeiro"
   endpoint_configuration {
     types = ["REGIONAL"]
   }
 }

 resource "aws_api_gateway_rest_api" "app" {
   name = "api-gtw-tremligeiro"
   endpoint_configuration {
     types = ["REGIONAL"]
   }
 }