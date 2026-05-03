terraform {
  backend "s3" {
    bucket         = "terraform-test-911558392071-us-east-1-an"
    key            = "terraform-lab/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraformlocks"
  }
}
