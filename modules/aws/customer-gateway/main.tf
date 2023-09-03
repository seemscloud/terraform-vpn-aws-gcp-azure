resource "aws_customer_gateway" "customer_gateway" {
  count = length(var.data)

  bgp_asn    = var.data[count.index].bgp_asn
  ip_address = var.data[count.index].ip_address
  type       = var.data[count.index].type

  tags = merge(var.tags, var.default_tags, var.data[count.index].tags)
}