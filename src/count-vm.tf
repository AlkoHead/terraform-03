#образе ОС
data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}

#создаем 2 web-1 и web-2
resource "yandex_compute_instance" "web" {
  count = 2
  
  name        = "web-${count.index+1}"
  hostname    = "web-${count.index+1}" # для fqdn
  platform_id = "standard-v1"

  resources {
    #cores  = 2
    cores = var.vm_web_cores
    #memory = 1
    memory = var.vm_web_memory
    #core_fraction = 5
    core_fraction = var.vm_web_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }   
  }

  metadata = {
    ssh-keys = "ubuntu:${var.public_key}"
  }

  scheduling_policy { preemptible = true }

  network_interface { 
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [
        yandex_vpc_security_group.example.id
    ]
  }
depends_on = [yandex_compute_instance.db_vm]
}