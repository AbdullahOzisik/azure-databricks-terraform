resource "azurerm_user_assigned_identity" "dbx_uami" {
  name                = "uami-dbx"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_role_assignment" "dbx_uami_blob_contrib" {
  scope                = azurerm_storage_account.adls.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.dbx_uami.principal_id
}