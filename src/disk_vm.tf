resource "yandex_compute_disk" "data_disks" {
#    count = 3
    count = var.vm_data_disks_count
#    size = 1
    size = var.vm_data_disks_size
#    type = "network-hdd"
    type = var.vm_data_disks_hdd
    name = "data-disk-${count.index + 1}"
}

resource "yandex_compute_instance" "storage" {
    name = "storage"
    hostname = "storage" # fqdn
    platform_id = "standard-v1"

    resources {
#      cores = 2
      cores = var.vm_storage_cores
#      memory = 1
      memory = var.vm_storage_memory
#      core_fraction = 5
      core_fraction = var.vm_storage_fraction
    }

    boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.data_disks
    content {
      disk_id = secondary_disk.value.id
    } 
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat = true
  }
}