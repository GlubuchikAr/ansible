###vm_web vars

variable "vm_web_family" {
  type        = string
  description = "image_family"
  default     = "ubuntu-2404-lts"
}

variable "vm_web_name" {
  type        = string
  description = "instance_name"
  default     = "netology-develop-platform-web"
}

variable "vm_web_platform_id" {
  type        = string
  description = "instance_platform_id"
  default     = "standard-v1"
}

variable "vm_web_disk_type" {
  type        = string
  description = "instance_disk_type"
  default     = "network-hdd"
}

variable "vm_web_disk_size" {
  type        = number
  description = "instance_disk_size"
  default     = 10
}

variable "vm_web_scheduling_policy" {
  type        = bool
  description = "instance_scheduling_policy"
  default     = true
}

variable "vm_web_network_interface_nat" {
  type        = bool
  description = "instance_network_interface_nat"
  default     = false
}

###vm_db vars

variable "vm_db_family" {
  type        = string
  description = "image_family"
  default     = "ubuntu-2004-lts"
}

variable "vm_db_name" {
  type        = string
  description = "instance_name"
  default     = "netology-develop-platform-db"
}

variable "vm_db_platform_id" {
  type        = string
  description = "instance_platform_id"
  default     = "standard-v1"
}

variable "vm_db_disk_type" {
  type        = string
  description = "instance_disk_type"
  default     = "network-hdd"
}

variable "vm_db_disk_size" {
  type        = number
  description = "instance_disk_size"
  default     = 10
}

variable "vm_db_scheduling_policy" {
  type        = bool
  description = "instance_scheduling_policy"
  default     = true
}

variable "vm_db_network_interface_nat" {
  type        = bool
  description = "instance_network_interface_nat"
  default     = false
}

variable "vm_db_zone" {
  type        = string
  description = "instance_zone"
  default     = "ru-central1-b"
}

variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_db_subnet_name" {
  type        = string
  default     = "develop_db"
  description = "VPC network & subnet name"
}

variable "instance_resources" {
  type        = map(object({
    cores         = number,
    memory        = number,
    core_fraction = number
  }))
  default     = {default = {cores = 2, memory = 1, core_fraction = 5}}
  description = "instance_resources"
}

variable "instance_metadata" {
  type        = map(object({
    serial-port-enable = number,
    ssh-keys           = string
  }))
  default     = {default = {serial-port-enable = 1, ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCf+mkgGwx3KKMFm5TYSYa/2Y1vciycnp4Oc6yBUOMP/Ykm7VHpSTqnUlYIrXqKEoWxla45xPcZBSFdyRvA95EGgHpbh3B5mszmcH+8OSBeAQtkk6A6tLEAhRMShNwHTp65tAXGxtKW0gNlHzne/+5fCnI4UYK1Ig+cC8bOhLbnNEQKMYzNvSwHarQC3buCLKgW/S0GGjVqfjX9ho0FoZhuh2wB9cF5sB8sKBKn8KQ12IEHZyPzqas2SnuBWHAkOqlkprBRp5WxZhs7cLUjfnd4qtlKCp5J+agCKHamn7h2tFTNwNMGd9EJfIPlE54vjz0tI9UD8nKrMUx6R95RC8jlK3nSv1akhwRN4o3soWHrGQgiqpI2Z145bj38Hg8KCEzDNr5H2iKWoCOTRAGb3odIysENMqUQtbk6jql7gJqd6tLgA8VOg75B/fFFLpGCVjhy5rCYXWwAU1h/X2EjxQlAeE789sW2bHisiRzG9loGNWFTuH2rWdakHxH9Tg5dbTE= glubuchik@glubuchik-pc"}}
  description = "instance_metadata"
}
