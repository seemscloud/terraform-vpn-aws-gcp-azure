output "customer_gateway" {
  value = {
    for customer_gateway in aws_customer_gateway.customer_gateway : customer_gateway.tags["Name"] => customer_gateway.id
  }
}