aws_region = "ap-south-1"

vpc_cidr   = "10.0.0.0/25"
vpc_name   = "otms-vpc"

standard_tags = {
  Application = "OTMS"
  Owner       = "Durgesh"
  Environment = "Dev"
  CostCenter  = "dev-otms"
}
