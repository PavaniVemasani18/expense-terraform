module "test1" {
  source = "./demo"
  message="hello"
  bucket = "buckt-tf-states"
  key = "test3/dev/state"
  region = "us-east-1"
}
module "test2"{
  source = "./demo"
  message="hai"
  bucket = "buckt-tf-states"
  key = "test2/dev/state"
  region = "us-east-1"
}