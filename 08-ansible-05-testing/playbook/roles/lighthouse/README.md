Ansible lighthouse role
=========

Устанавливает и настраивает lighthouse

Requirements
------------



Role Variables
--------------

| Name           | Default Value | Description                        |
| -------------- | ------------- | -----------------------------------|
| `lighthouse_repo` | https://github.com/VKCOM/lighthouse.git | Ссылка на git репозиторий lighthouse |
| `vector_config_dir` | {{ ansible_user_dir }}/vector_config | директория для конфигурации vector |
| `vector_config` |  | шаблон из которого будет создан конфигурационный файл vector.yml |