module "ctd-frontend" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket                   = "ctd-frontend-${var.tag}"
  control_object_ownership = true
  block_public_acls        = true
  block_public_policy      = true
  ignore_public_acls       = true
  restrict_public_buckets  = true

  versioning   = {
    enabled = false
  }

   cors_rule = [
    {
      allowed_methods = ["PUT"]
      allowed_origins = ["*"]
      allowed_headers = ["*"]
      expose_headers  = []
      max_age_seconds = 3000
    }
  ]

}

# data "aws_iam_policy_document" "s3_bucket_policy" {
#   statement {
#     actions   = ["s3:GetObject","s3:ListBucket"]
#     resources = ["${module.ctd-frontend.s3_bucket_arn}/*",
#                   module.ctd-frontend.s3_bucket_arn]

#     principals {
#       type        = "AWS"
#       identifiers = var.cloudfront_origin_access_identity_iam_arns
#     }
#   }
# }
# S3 bucket policy update for cloudfront
# resource "aws_s3_bucket_policy" "ctd_policy" {
#   bucket = module.ctd-frontend.s3_bucket_id
#   policy = data.aws_iam_policy_document.s3_bucket_policy.json
# }


resource "aws_ssm_parameter" "s3_parameter" {
  name  = "/ctd/${var.tag}/frontend/s3"
  type  = "String"
  value = module.ctd-frontend.s3_bucket_id
}
