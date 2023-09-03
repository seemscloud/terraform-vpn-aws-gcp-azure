resource "aws_vpn_gateway" "vpn_gateway" {
  count = length(var.data)

  availability_zone = "${var.region_name}${var.data[count.index].availability_zone}"
  amazon_side_asn   = var.data[count.index].amazon_side_asn

  tags = merge(var.tags, var.default_tags, var.data[count.index].tags)
}

resource "aws_vpn_gateway_attachment" "gateway_attachment" {
  count = length(var.data)

  vpc_id         = var.data[count.index].vpc_id
  vpn_gateway_id = aws_vpn_gateway.vpn_gateway[count.index].id

  depends_on = [
    aws_vpn_gateway.vpn_gateway
  ]
}