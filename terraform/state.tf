terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "path/to/my-project/terraform.tfstate"
    region = "us-west-2"
  }
  
  lock {
    name = "my-project"
    type = "dynamodb"
    parameters = {
      table_name = "terraform-state-locks"
    }
  }
}
