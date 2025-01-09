resource "aws_servicecatalog_provisioned_product" "account" {
  name = "new-account"
  product_id = "prod-aw6rmaq7plaea"
  provisioning_artifact_id = "pa-uleitpzbpslcq"
  provisioning_parameters {
        key = "AccountName"
        value = "Test-Account"
  }
  provisioning_parameters {
        key = "AccountEmail"
        value = "test@domaindimensions.co.za"    
  }
  provisioning_parameters {
        key = "SSOUserFirstName"
        value = "Test"
  }
  provisioning_parameters {
        key = "SSOUserLastName"
        value = "testlast"    
  }
    provisioning_parameters {
        key = "SSOUserEmail"
        value = "test@domaindimensions.co.za"
  }
  provisioning_parameters {
        key = "ManagedOrganizationalUnit"
        value = "Sandbox (ou-qaok-zpp1cwpv)"    
  }
}