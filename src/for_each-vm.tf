variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    core_fraction = number
    disk_volume = number
    platform_id = string
  }))
 
  default = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 1
      core_fraction = 5
      disk_volume = 10
      platform_id = "standard-v1"
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 1
      core_fraction = 5
      disk_volume = 30
      platform_id = "standard-v1"
    }
  ]
}

resource "yandex_compute_instance" "db_vm" {
  for_each = { for i in var.each_vm : i.vm_name => i}
  name = each.value.vm_name
  hostname    = each.value.vm_name # fqdn

  platform_id = each.value.platform_id
  resources {
    cores = each.value.cpu
    memory = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk_volume
    }
  }

#   metadata = {
#     ssh-keys = "ubuntu:${var.public_key}"
#   }
  metadata = {
    ssh-keys = "ubuntu:${local.public_ssh_key}"
  }

  scheduling_policy {
    preemptible = true
  }

    network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [
      yandex_vpc_security_group.example.id
    ]
  }
#  depends_on = [yandex_compute_instance.web]  
}

