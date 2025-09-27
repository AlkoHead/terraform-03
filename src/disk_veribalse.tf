variable "vm_data_disks_count" {
  type = number
  default = 3
}

variable "vm_data_disks_size" {
  type = number
  default = 1 
}

variable "vm_data_disks_hdd" {
  type = string
  default = "network-hdd"
}

variable "vm_storage_cores" {
  type = number
  default = 2
}

variable "vm_storage_memory" {
  type = number
  default = 1
}

variable "vm_storage_fraction" {
  type = number
  default = 5
}