inputs = {
  vpc = [
    {
      cidr_block           = "10.255.0.0/16"
      enable_dns_hostnames = true
      enable_dns_support   = true
      tags                 = {
        Name = "lorem"
      }
    }
  ]
}