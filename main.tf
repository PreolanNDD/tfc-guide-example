resource "aws_s3_bucket" "template_bucket" {
  bucket = "account-creation-bucket"
}

resource "aws_s3_object" "cf_template" {
  bucket = aws_s3_bucket.template_bucket.id
  key    = "cloudformation/account-creation-template.yaml"
  source = "account-creation-template.yaml"
  acl    = "private"
}

resource "aws_servicecatalog_product" "custom_product" {
  name          = "Account Creation Product"
  owner         = "YourCompanyName"
  type  = "CLOUD_FORMATION_TEMPLATE"

  provisioning_artifact_parameters {
    name                   = "v1"
    description            = "Template to create AWS accounts"
    template_url           = aws_s3_object.cf_template.website_url
  }
  distributor   = "DD"
  description   = "Product for creating AWS accounts"
}

resource "aws_servicecatalog_portfolio" "custom_portfolio" {
  name          = "Custom Account Portfolio"
  description   = "Portfolio for provisioning AWS accounts"
  provider_name = "DD"
}

resource "aws_servicecatalog_portfolio_product_association" "example" {
  portfolio_id = aws_servicecatalog_portfolio.custom_portfolio.id
  product_id   = aws_servicecatalog_product.custom_product.id
}

resource "aws_servicecatalog_portfolio_association" "example" {
  portfolio_id = aws_servicecatalog_portfolio.example.id
  principal_arn = "arn:aws:iam::194722434270:user/Preolan"
}


