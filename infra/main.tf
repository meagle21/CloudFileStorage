provider "aws" {
  region = var.AWS_REGION
}

resource "aws_kms_key" "encryption_key" {
  description             = "This key is used to encrypt bucket objects"
  enable_key_rotation = true
  rotation_period_in_days = var.KEY_ROTATION_SCHEDULE
}

resource "aws_s3_bucket" "root-s3-bucket" {
  bucket = "${var.BUCKET_NAME}-${var.AWS_REGION}"
  tags = {
    Name = var.APP_NAME
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.root-s3-bucket.id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.encryption_key.arn
      sse_algorithm     = var.KEY_ALGORITHM
    }
  }
}

resource "aws_cognito_user_pool" "pool" {
  name = "${var.APP_NAME}-USERS-${var.AWS_REGION}"
  tags = {
    Name = var.APP_NAME
  }
}