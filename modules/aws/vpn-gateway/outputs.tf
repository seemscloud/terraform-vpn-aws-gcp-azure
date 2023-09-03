output "vpn_gateway" {
  value = {
    for vpn_gateway in aws_vpn_gateway.vpn_gateway : vpn_gateway.tags["Name"] => vpn_gateway.id
  }
}