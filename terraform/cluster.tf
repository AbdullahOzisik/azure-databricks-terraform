resource "databricks_cluster" "dev_cluster" {
  cluster_name            = "dev-single-node"
  spark_version           = data.databricks_spark_version.latest.id
  node_type_id            = data.databricks_node_type.smallest.id
  autotermination_minutes = 15

  autoscale {
  min_workers = 1
  max_workers = 3
}
  spark_conf = {
     "spark.hadoop.fs.azure.account.auth.type.storagelakehousedev8.dfs.core.windows.net" = "OAuth"
      "spark.hadoop.fs.azure.account.oauth.provider.type.storagelakehousedev8.dfs.core.windows.net" = "org.apache.hadoop.fs.azurebfs.oauth2.MsiTokenProvider"
      "spark.hadoop.fs.azure.account.oauth2.client.id.storagelakehousedev8.dfs.core.windows.net" = azurerm_user_assigned_identity.dbx_uami.client_id
}

  # Required when NO_ISOLATION isn't allowed in the workspace
  data_security_mode = "SINGLE_USER"
  single_user_name   = "abdullah.ozisik@datapartner365.nl"

  custom_tags = {
    Environment = "dev"
  }
}

data "databricks_spark_version" "latest" {
  latest = true
}
data "databricks_node_type" "smallest" {
  local_disk = true
}
