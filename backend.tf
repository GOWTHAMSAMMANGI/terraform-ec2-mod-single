terraform {
  backend "s3" {
    bucket  = "tensorgobucket"
    key     = "tensorgo.tfstate"
    region  = var.region
    encrypt = true
  }
}