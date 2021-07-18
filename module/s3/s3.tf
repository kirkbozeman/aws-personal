# note: a bucket must be empty to delete/destroy it in both console and tf
# note: if you change the label (i.e. acloudguru-website) it will try to destroy the resource


#################### A CLOUD GURU WEBSITE ####################

resource "aws_s3_bucket" "acloudguru-mywebsite" {
  bucket = "acloudguru-mywebsite-kbozeman1"
  acl = "private"
}

# this can be used to turn on/off "Block all public access" permissions
resource "aws_s3_bucket_public_access_block" "acloudguru-mywebsite-block" {
  bucket = aws_s3_bucket.acloudguru-mywebsite.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# this makes all objects in bucket public
resource "aws_s3_bucket_policy" "acloudguru-mywebsite-public-policy" {
  bucket = aws_s3_bucket.acloudguru-mywebsite.id
  policy = <<POLICY
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "PublicReadGetObject",
			"Effect": "Allow",
			"Principal": "*",
			"Action": [
				"s3:GetObject"
			],
			"Resource": [
				"${aws_s3_bucket.acloudguru-mywebsite.arn}/*"
			]
		}
	]
}
POLICY
}