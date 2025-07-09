terraform {
  backend "s3" {
    bucket         = "tfstate-p14-demo"
    key            = "env/dev/network-skeleton/vpc/terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "sprint4-statelock"
    encrypt        = true
  }
}
