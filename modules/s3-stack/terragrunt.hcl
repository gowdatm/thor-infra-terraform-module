terraform {
  source = "./terraform-aws-s3-bucket"
}

inputs = {
  bucket = "my-s3-bucket"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}