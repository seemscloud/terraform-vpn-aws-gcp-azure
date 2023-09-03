output "vpc" {
  value = {for vpc in aws_vpc.vpc : vpc.tags["Name"] => vpc.id}
}