resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",
    {
      webservers = yandex_compute_instance.web  # ВМ из задания 2.1
      databases  = yandex_compute_instance.db_vm         # ВМ из задания 3.2 (for_each)
      storage    = [yandex_compute_instance.storage]     # ВМ из задания 4
    }
  )
  filename = "${abspath(path.module)}/hosts.cfg"
}