terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.5"
}

provider "yandex" {
  # token     = var.token
  cloud_id                 = "b1gu37souccvf3jtjomo"
  folder_id                = "b1gliq36v37iol484r5a"
  zone                     = var.default_zone
  service_account_key_file = file("~/.authorized_key.json")
}
