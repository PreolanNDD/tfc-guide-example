provider "aws" {
  region = "us-east-1" # Replace with your desired AWS region
}

provider "aws" {
  alias  = "aft_management"
  region = "us-east-1" # Replace with the region where the resource was created
}

