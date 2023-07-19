resource "linode_database_mysql" "poseidon_mysql" {
  label = "poseidon-prd.db-mysql.yto"
  engine_id = "mysql/8.0.30"
  region = "ca-central"
  type = "g6-nanode-1"

  allow_list = ["0.0.0.0/0"]
  cluster_size = 1
  encrypted = true
  ssl_connection = true

  updates {
    day_of_week = "saturday"
    duration = 1
    frequency = "monthly"
    hour_of_day = 5
    week_of_month = 2
  }
}