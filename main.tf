
module "s3" {
  source = "./s3"
  cloudfront_origin_access_identity_iam_arns = module.cloudfront.cloudfront_origin_access_identity_iam_arns
  tag = var.tag
}

module "cloudfront" {
  source = "./cloudfront"
  aws_region = var.region
  bucket_name = module.s3.bucket_name
  bucket_regional_domain_name = module.s3.s3_bucket_bucket_regional_domain_name
  cname = [var.cname]
  ssl_certificate_arn = var.ssl_certificate_arn_cloudfront
  tag = var.tag
}

module "vpc" {
  source = "./vpc"
  tag    = var.tag
}

module "ec2" {
  source = "./modules/ec2"
  tag = var.tag
  subnet_id = module.vpc.ctd_subnet1_id
  vpc_security_group_ids = module.vpc.vpc_security_group_ids
  instance_type = var.instance_type
  ssh_public_key = var.ssh_public_key
  depends_on = [
    module.vpc
  ]
}