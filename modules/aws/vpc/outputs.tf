output "vpc" {
  value = {for network in aws_vpc.vpc : network.tags["Name"] => network.id}
}