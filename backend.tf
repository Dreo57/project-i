# Below is Backend block
terraform {
  backend "s3" {
    bucket = "airbnb-statefile-22112"
    key = "project-i.tfstate"
    region = "us-east-1"
    profile = "default"
    dynamodb_table = "airbnb-statefile-lock"
  }
}
