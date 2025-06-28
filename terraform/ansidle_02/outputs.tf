output "ansible" {

  value = [
    { clickhouse = [yandex_compute_instance.clickhouse.name, yandex_compute_instance.clickhouse.network_interface[0].nat_ip_address, yandex_compute_instance.clickhouse.network_interface[0].ip_address, yandex_compute_instance.clickhouse.fqdn] },
    { vector = [yandex_compute_instance.vector.name, yandex_compute_instance.vector.network_interface[0].nat_ip_address, yandex_compute_instance.vector.network_interface[0].ip_address, yandex_compute_instance.vector.fqdn] },
    { lighthouse = [yandex_compute_instance.lighthouse.name, yandex_compute_instance.lighthouse.network_interface[0].nat_ip_address, yandex_compute_instance.lighthouse.network_interface[0].ip_address, yandex_compute_instance.lighthouse.fqdn] },
  ]
}