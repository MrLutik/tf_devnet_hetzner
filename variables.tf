variable "location" {
  default = "nbg1"

  # DE Falkenstein fsn1
  # DE Nuremberg nbg1
  # FI Helsinki hel1
}

variable "server_type" {
  default = "cpx31"
}


variable "os_type" {
  default = "ubuntu-20.04"
}

variable "pub_key" {}
variable "pvt_key" {}
variable "do_token" {}
