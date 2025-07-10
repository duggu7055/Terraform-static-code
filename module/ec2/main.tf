terraform {
  backend "s3" {}  # required for Terragrunt to inject remote state
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }
}
