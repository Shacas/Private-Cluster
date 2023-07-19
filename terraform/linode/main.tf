resource "linode_instance" "nginx" {
  label = "test-nginx"

  group             = "Productions"
  region            = data.linode_region.main.id
  type              = data.linode_instance_type.linode1g.id
  private_ip        = true

  connection {
    host        = self.ip_address
    type        = "ssh"
    user        = "root"
    agent       = "false"
    private_key = chomp(file(var.private_ssh_key))
  }

  disk {
    label           = "boot"
    size            = data.linode_instance_type.linode1g.disk / 2
    authorized_keys = [chomp(file(var.public_ssh_key))]
    root_pass       = "${random_string.password.result}"
    image           = data.linode_image.debian11.id
  }

  config {
    label  = "nginx"
    kernel = "linode/latest-64bit"

    devices {
      sda {
        disk_label = "boot"
      }
    }
  }
   provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "apt-get -q update",
    ]
  }
}