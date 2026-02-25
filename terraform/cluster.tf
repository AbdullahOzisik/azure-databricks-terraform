resource "databricks_cluster" "dev_cluster" {
  cluster_name            = "dev-single-node"
  spark_version           = data.databricks_spark_version.latest.id
  node_type_id            = data.databricks_node_type.smallest.id
  autotermination_minutes = 15

  num_workers             = 1

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