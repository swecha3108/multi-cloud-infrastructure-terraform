terraform {
  backend "s3" {
    bucket         = "swecha-multicloud-3ad39105-tfstate"
    key            = "aws/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "swecha-multicloud-tflock"
    encrypt        = true
  }
}
