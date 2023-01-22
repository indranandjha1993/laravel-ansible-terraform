terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "path/to/my-project/terraform.tfstate"
    region = "us-west-2"
  }
}
