terraform {
  backend "s3" {
    bucket         = "asaghatelyan"
    key            = "tfstate/state"
    region         = "us-east-2"
    dynamodb_table = "AS_LockTable"
  }

}