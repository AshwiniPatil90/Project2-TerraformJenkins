terraform {
  backend "s3" {
    #AWS S3 bucket for remote backend
    bucket = "my-demo-bucket-ashwinipatil"
    key    = "terraform.tfstate"
    region = "us-east-2"

    #AWS DynamoDB table for state locking
    dynamodb_table = "my-demo-table-ashwinipatil"
    encrypt        = true
  }
}
