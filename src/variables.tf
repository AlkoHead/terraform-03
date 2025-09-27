###cloud vars
# variable "token" {
#   type        = string
#   description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
# }

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

# ssh
variable "public_key" {
  type        = string
  default     = "<your_ssh_ed25519_key>"
  description = "ssh-keygen -t ed25519"
}

# # VM WEB

# variable "vm_web_cores" {
#   type = number
#   default = 2
# }

# variable "vm_web_memory" {
#   type = number
#   default = 1
# }

# variable "vm_web_fraction" {
#   type = number
#   default = 5
# }

# disk_vm

# variable "vm_data_disks_count" {
#   type = number
#   default = 3
# }

# variable "vm_data_disks_size" {
#   type = number
#   default = 1 
# }

# variable "vm_data_disks_hdd" {
#   type = string
#   default = "network-hdd"
# }

# VM storage

# variable "vm_storage_cores" {
#   type = number
#   default = 2
# }

# variable "vm_storage_memory" {
#   type = number
#   default = 1
# }

# variable "vm_storage_fraction" {
#   type = number
#   default = 5
# }