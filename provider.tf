terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 3.74.1"
   }
 }
}
provider "aws" {
  profile                 = "test"
  shared_credentials_file = "~/.aws/credentials"
  region                  = "us-east-1"
}
