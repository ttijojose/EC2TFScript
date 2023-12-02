terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  access_key="AKIAYF7VJFYGRYDKOYGJ"
  secret_key="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"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

terraform {
  backend "s3" {
    bucket = "terraformsf"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}