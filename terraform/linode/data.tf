data "linode_profile" "me" {
}

data "linode_region" "main" {
  id = var.region
}

data "linode_instance_type" "linode1g" {
  id = "g6-nanode-1"
}

data "linode_instance_type" "linode2g" {
  id = "g6-standard-1"
}

data "linode_instance_type" "linode4g" {
  id = "g6-standard-2"
}

data "linode_image" "debian11" {
  id = "linode/debian11"
}

data "linode_image" "debian10" {
  id = "linode/debian10"
}

data "linode_image" "archlinux" {
  id = "linode/arch"
}