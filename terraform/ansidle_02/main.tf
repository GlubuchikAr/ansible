resource "yandex_vpc_network" "ansible" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "ansible" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.ansible.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}

resource "yandex_compute_instance" "clickhouse" {
  name        = "clickhouse"
  platform_id = "standard-v1"
  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = "network-hdd"
      size     = 10
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.ansible.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCf+mkgGwx3KKMFm5TYSYa/2Y1vciycnp4Oc6yBUOMP/Ykm7VHpSTqnUlYIrXqKEoWxla45xPcZBSFdyRvA95EGgHpbh3B5mszmcH+8OSBeAQtkk6A6tLEAhRMShNwHTp65tAXGxtKW0gNlHzne/+5fCnI4UYK1Ig+cC8bOhLbnNEQKMYzNvSwHarQC3buCLKgW/S0GGjVqfjX9ho0FoZhuh2wB9cF5sB8sKBKn8KQ12IEHZyPzqas2SnuBWHAkOqlkprBRp5WxZhs7cLUjfnd4qtlKCp5J+agCKHamn7h2tFTNwNMGd9EJfIPlE54vjz0tI9UD8nKrMUx6R95RC8jlK3nSv1akhwRN4o3soWHrGQgiqpI2Z145bj38Hg8KCEzDNr5H2iKWoCOTRAGb3odIysENMqUQtbk6jql7gJqd6tLgA8VOg75B/fFFLpGCVjhy5rCYXWwAU1h/X2EjxQlAeE789sW2bHisiRzG9loGNWFTuH2rWdakHxH9Tg5dbTE= glubuchik@glubuchik-pc"
  }
  zone = var.default_zone
}

resource "yandex_compute_instance" "vector" {
  name        = "vector"
  platform_id = "standard-v1"
  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = "network-hdd"
      size     = 10
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.ansible.id
    nat       = true
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCf+mkgGwx3KKMFm5TYSYa/2Y1vciycnp4Oc6yBUOMP/Ykm7VHpSTqnUlYIrXqKEoWxla45xPcZBSFdyRvA95EGgHpbh3B5mszmcH+8OSBeAQtkk6A6tLEAhRMShNwHTp65tAXGxtKW0gNlHzne/+5fCnI4UYK1Ig+cC8bOhLbnNEQKMYzNvSwHarQC3buCLKgW/S0GGjVqfjX9ho0FoZhuh2wB9cF5sB8sKBKn8KQ12IEHZyPzqas2SnuBWHAkOqlkprBRp5WxZhs7cLUjfnd4qtlKCp5J+agCKHamn7h2tFTNwNMGd9EJfIPlE54vjz0tI9UD8nKrMUx6R95RC8jlK3nSv1akhwRN4o3soWHrGQgiqpI2Z145bj38Hg8KCEzDNr5H2iKWoCOTRAGb3odIysENMqUQtbk6jql7gJqd6tLgA8VOg75B/fFFLpGCVjhy5rCYXWwAU1h/X2EjxQlAeE789sW2bHisiRzG9loGNWFTuH2rWdakHxH9Tg5dbTE= glubuchik@glubuchik-pc"
  }
  zone = var.default_zone
}

resource "yandex_compute_instance" "lighthouse" {
  name        = "lighthouse"
  platform_id = "standard-v1"
  resources {
    cores         = 2
    memory        = 1
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = "network-hdd"
      size     = 10
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.ansible.id
    nat       = true
  }
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCf+mkgGwx3KKMFm5TYSYa/2Y1vciycnp4Oc6yBUOMP/Ykm7VHpSTqnUlYIrXqKEoWxla45xPcZBSFdyRvA95EGgHpbh3B5mszmcH+8OSBeAQtkk6A6tLEAhRMShNwHTp65tAXGxtKW0gNlHzne/+5fCnI4UYK1Ig+cC8bOhLbnNEQKMYzNvSwHarQC3buCLKgW/S0GGjVqfjX9ho0FoZhuh2wB9cF5sB8sKBKn8KQ12IEHZyPzqas2SnuBWHAkOqlkprBRp5WxZhs7cLUjfnd4qtlKCp5J+agCKHamn7h2tFTNwNMGd9EJfIPlE54vjz0tI9UD8nKrMUx6R95RC8jlK3nSv1akhwRN4o3soWHrGQgiqpI2Z145bj38Hg8KCEzDNr5H2iKWoCOTRAGb3odIysENMqUQtbk6jql7gJqd6tLgA8VOg75B/fFFLpGCVjhy5rCYXWwAU1h/X2EjxQlAeE789sW2bHisiRzG9loGNWFTuH2rWdakHxH9Tg5dbTE= glubuchik@glubuchik-pc"
  }
  zone = var.default_zone
}