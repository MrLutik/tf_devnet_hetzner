resource "hcloud_server" "genesis" {
  name        = "genesis"
  image       = var.os_type
  server_type = var.server_type
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "localnet-1"
  }
  provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt upgrade -y", "sudo apt install python3 -y", "echo Done"]
    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "root"
      private_key = file(var.pvt_key)
    }
  }
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook genesis-install.yml -u 'root' -i '${self.ipv4_address},' --private-key '${var.pvt_key}' -e 'pub_key=${var.pub_key}'"
  }
}


resource "hcloud_server" "validator" {
  name        = "validator"
  image       = var.os_type
  server_type = var.server_type
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.default.id]
  labels = {
    type = "localnet-1"
  }
}


output "genesis_ip_address" {
  value = hcloud_server.genesis.ipv4_address
}

output "validator_ip_address" {
  value = hcloud_server.validator.ipv4_address
}



