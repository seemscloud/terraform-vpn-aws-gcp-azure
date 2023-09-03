resource "aws_internet_gateway" "internet_gateway" {
  count = length(var.data)

  tags = merge(var.tags, var.default_tags, var.data[count.index].tags)
}

resource "aws_internet_gateway_attachment" "internet_gateway_attachment" {
  count               = length(var.data)
  internet_gateway_id = aws_internet_gateway.internet_gateway[count.index].id
  vpc_id              = var.data[count.index].vpc_id

  depends_on = [
    aws_internet_gateway.internet_gateway
  ]
}

resource "aws_route_table" "route_table" {
  count  = length(var.data)
  vpc_id = var.data[count.index].vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway[count.index].id
  }

  tags = merge(var.tags, var.default_tags, var.data[count.index].tags)

  depends_on = [
    aws_internet_gateway_attachment.internet_gateway_attachment
  ]
}