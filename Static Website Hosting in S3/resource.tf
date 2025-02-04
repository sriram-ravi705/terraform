resource "random_integer" "random_s3_name" {
  min = 1
  max = 5000
}

resource "aws_s3_bucket" "static_website" {
  bucket = "${random_integer.random_s3_name.result}static"
}

resource "aws_s3_object" "index_file" {
  bucket = aws_s3_bucket.static_website.id
  key = "index.html"
  source = "index.html"
  etag = filemd5("index.html")
  content_type = "text/html"
}

resource "aws_s3_object" "error_file" {
  bucket = aws_s3_bucket.static_website.id
  key = "error.html"
  source = "error.html"
  etag = filemd5("error.html")
  content_type = "text/html"
}

resource "aws_s3_bucket_public_access_block" "static_website" {
  bucket = aws_s3_bucket.static_website.id
  block_public_acls = false
  block_public_policy = false
  restrict_public_buckets = false
  ignore_public_acls = false
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.static_website.id
  policy = jsonencode({
    "Version" = "2012-10-17",
    "Statement" = [
      {
        Sid = "Statement1",
        Effect = "Allow",
        Action = [
          "s3:GetObject"
        ],
        Resource = ["arn:aws:s3:::${aws_s3_bucket.static_website.id}/*"]
        Principal = "*"
      }
    ]
  })
}

resource "aws_s3_bucket_website_configuration" "web_config" {
  bucket = aws_s3_bucket.static_website.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}