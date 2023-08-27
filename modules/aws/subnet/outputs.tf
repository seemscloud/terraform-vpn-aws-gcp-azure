#output "subnet" {
#  value = {for network in aws_subnet.subnet : network.tags["Name"] => network.id}
#}