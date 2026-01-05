
terraform {
  backend "s3" {
    bucket = "irynasabinina-terraform-state-lesson-6"
    key            = "lesson-6/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}