output "vpn_connection" {
  value = {
    for vpn_connection in aws_vpn_connection.vpn_connection : vpn_connection.tags["Name"] => [
      vpn_connection.tunnel1_address,
      vpn_connection.tunnel2_address
    ]
  }
}