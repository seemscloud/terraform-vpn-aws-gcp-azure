resource "aws_vpc" "vpc" {
  count = length(var.data)

  cidr_block           = var.data[count.index].cidr_block
  enable_dns_hostnames = var.data[count.index].enable_dns_hostnames
  enable_dns_support   = var.data[count.index].enable_dns_support

  tags = merge(var.tags, var.default_tags, var.data[count.index].tags)
}