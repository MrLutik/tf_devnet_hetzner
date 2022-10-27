resource "hcloud_server" "validator" {
  count       = var.instances
  name        = "validator-${count.index}"
  image       = var.os_type
  server_type = var.server_type
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "localnet-1"
  }
  user_data = file("user_data.yaml")
}


