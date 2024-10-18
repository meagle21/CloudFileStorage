variable AWS_REGION {
    default = "us-east-2"
}

variable BUCKET_NAME {
    default = "eagle-file-storage-module"
}

variable APP_NAME {
    default = "BasicFileS3Storage"
}

variable KEY_ROTATION_SCHEDULE {
    default = 90
}

variable KEY_ALGORITHM {
    default = "aws:kms"
}
