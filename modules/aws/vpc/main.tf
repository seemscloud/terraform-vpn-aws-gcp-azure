resource "aws_vpc" "vpc" {
  count = length(var.inputs)

  cidr_block           = var.inputs[count.index].cidr_block
  enable_dns_hostnames = var.inputs[count.index].enable_dns_hostnames
  enable_dns_support   = var.inputs[count.index].enable_dns_support

  tags = merge(var.tags, var.default_tags, var.inputs[count.index].tags)
}