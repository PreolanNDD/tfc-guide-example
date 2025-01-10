resource "aws_servicecatalog_provisioned_product" "account" {
  name = "new1-account"
  product_id = "prod-aw6rmaq7plaea"
  provisioning_artifact_id = "pa-uleitpzbpslcq"
  provisioning_parameters {
        key = "AccountName"
        value = "Test-Account-2"
  }
  provisioning_parameters {
        key = "AccountEmail"
        value = "test2@domaindimensions.co.za"    
  }
  provisioning_parameters {
        key = "SSOUserFirstName"
        value = "Test2"
  }
  provisioning_parameters {
        key = "SSOUserLastName"
        value = "testlast2"    
  }
    provisioning_parameters {
        key = "SSOUserEmail"
        value = "test2@domaindimensions.co.za"
  }
  provisioning_parameters {
        key = "ManagedOrganizationalUnit"
        value = "Sandbox (ou-qaok-zpp1cwpv)"    
  }
}