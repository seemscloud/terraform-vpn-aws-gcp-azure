resource "aws_vpc" "vpc" {
  count = length(var.data)

  cidr_block           = var.data[count.index].cidr_block
  enable_dns_hostnames = var.data[count.index].enable_dns_hostnames
  enable_dns_support   = var.data[count.index].enable_dns_support

  tags = merge(var.tags, var.default_tags, var.data[count.index].tags)
}

resource "aws_default_route_table" "default_route_table" {
  count = length(var.data)

  default_route_table_id = aws_vpc.vpc[count.index].default_route_table_id

  route = []

  tags = merge(var.tags, var.default_tags, var.data[count.index].tags)

  depends_on = [
    aws_vpc.vpc
  ]
}

resource "aws_default_network_acl" "default_network_acl" {
  count = length(var.data)

  default_network_acl_id = aws_vpc.vpc[count.index].default_network_acl_id

  lifecycle {
    ignore_changes = [subnet_ids]
  }

  tags = merge(var.tags, var.default_tags, var.data[count.index].tags)

  depends_on = [
    aws_vpc.vpc
  ]
}

resource "aws_default_security_group" "default_security_group" {
  count  = length(var.data)
  vpc_id = aws_vpc.vpc[count.index].id

  tags = merge(var.tags, var.default_tags, var.data[count.index].tags)

  depends_on = [
    aws_vpc.vpc
  ]
}

resource "aws_default_vpc_dhcp_options" default_vpc_dhcp_options {
  count = length(var.data)

  tags = merge(var.tags, var.default_tags, var.data[count.index].tags)

  depends_on = [
    aws_vpc.vpc
  ]
}

resource "aws_vpc_dhcp_options_association" "default_vpc_dhcp_options" {
  count           = length(var.data)
  vpc_id          = aws_vpc.vpc[count.index].id
  dhcp_options_id = aws_default_vpc_dhcp_options.default_vpc_dhcp_options[count.index].id

  depends_on = [
    aws_default_vpc_dhcp_options.default_vpc_dhcp_options
  ]
}