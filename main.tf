provider "aws" {
  region     = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"

# note: you could also do this instead of shared_credentials_file, but it's terribly insecure:
#  access_key = "AWS ACCESS KEY"
#  secret_key = "AWS SECRET KEY"
}

module "S3" {
  source = "./module/s3"  # note that this must be a DIRECTORY
}


