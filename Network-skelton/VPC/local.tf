locals {
  env_prefix = "dev"
  prefixed_vpc_name = "${local.env_prefix}-${var.vpc_name}"
}
