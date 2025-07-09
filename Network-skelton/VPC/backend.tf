terraform {
  backend "s3" {
    bucket         = "tfstate-p14-demo"
    key            = "network-skeleton/vpc/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "sprint4-statelock"
    encrypt        = true
  }
}
