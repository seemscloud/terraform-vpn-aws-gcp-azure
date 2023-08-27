resource "aws_subnet" "subnet" {
  count = length(var.data)

  vpc_id            = var.data[count.index].vpc_id
  cidr_block        = var.data[count.index].cidr_block
  availability_zone = "${var.region_name}${var.data[count.index].availability_zone}"

  tags = merge(var.tags, var.default_tags, var.data[count.index].tags)
}