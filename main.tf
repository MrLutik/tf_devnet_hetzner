terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.35.2"
    }
  }
}
provider "hcloud" {
  token = var.do_token
}
