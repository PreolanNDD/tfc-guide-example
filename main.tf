resource "aws_s3_bucket" "account_creation_bucket" {
  bucket = "account-creation-bucket1"
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.account_creation_bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.account_creation_bucket.id
  acl    = "private"
}

resource "aws_s3_object" "cf_template" {
  bucket = aws_s3_bucket.account_creation_bucket.id
  key    = "cloudformation/account-creation-template.yaml"
  source = "account-creation-template.yaml"
  acl    = "private"
}

resource "aws_servicecatalog_product" "custom_product" {
  name          = "Account Creation Product"
  owner         = "YourCompanyName"
  type          = "CLOUD_FORMATION_TEMPLATE"

  provisioning_artifact_parameters {
    name                   = "v1"
    description            = "Template to create AWS accounts"
    type                   = "CLOUD_FORMATION_TEMPLATE"
    template_url           = "https://s3.amazonaws.com/${aws_s3_bucket.account_creation_bucket.bucket}/cloudformation/${aws_s3_object.cf_template.key}"
  }
  distributor   = "DD"
  description   = "Product for creating AWS accounts"
}

resource "aws_servicecatalog_portfolio" "custom_portfolio" {
  name          = "Custom Account Portfolio"
  description   = "Portfolio for provisioning AWS accounts"
  provider_name = "DD"
}

resource "aws_servicecatalog_product_portfolio_association" "example" {
  portfolio_id = aws_servicecatalog_portfolio.custom_portfolio.id
  product_id   = aws_servicecatalog_product.custom_product.id
}

resource "aws_servicecatalog_principal_portfolio_association" "example" {
  portfolio_id = aws_servicecatalog_portfolio.custom_portfolio.id
  principal_arn = "arn:aws:iam::194722434270:user/Preolan"
}


