resource "aws_vpc" "dev_otms_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    {
      Name = local.prefixed_vpc_name
    },
    var.standard_tags
  )
}

