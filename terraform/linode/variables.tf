variable "linode_token" {
  description = "Linode APIv4 Personal Access Token"
}

variable "region" {
  default = "ca-central"
}

variable "public_ssh_key" {
  description = "SSH Public Key Fingerprint"
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_ssh_key" {
  description = "SSH Public Key Fingerprint"
  default     = "~/.ssh/id_rsa"
}

resource "random_string" "password" {
  length  = 30
  special = true
}