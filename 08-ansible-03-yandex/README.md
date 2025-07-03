# Домашнее задание к занятию 3 «Использование Ansible»

## Подготовка к выполнению

#### 1. Подготовьте в Yandex Cloud три хоста: для `clickhouse`, для `vector` и для `lighthouse`.
- К сожалению плохой интернет, не могу нормально работать с облаком, пришлось поднимать машины на virtualbox?
- Так как centos 7 уже не поддерживается, для создания ВМ был использован образ ubuntu-server 24.04

#### 2. Репозиторий LightHouse находится [по ссылке](https://github.com/VKCOM/lighthouse).

## Основная часть

#### 1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает LightHouse.
#### 2. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.
#### 3. Tasks должны: скачать статику LightHouse, установить Nginx или любой другой веб-сервер, настроить его конфиг для открытия LightHouse, запустить веб-сервер.
- В [site.yml](playbook%2Fsite.yml) добавлен PLAY с `tags=lighthouse`, устанавливающий и настраивающий lighthouse. 
#### 4. Подготовьте свой inventory-файл `prod.yml`.
[virtualbox.yml](playbook%2Finventory%2Fvirtualbox.yml)
#### 5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
#### 6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
```shell
glubuchik@glubuchik-X15-AT-22:~/обучение/ansible/08-ansible-03-yandex/playbook$ ansible-playbook -i ./inventory/virtualbox.yml site.yml --check
[WARNING]: Found both group and host with same name: clickhouse
[WARNING]: Found both group and host with same name: lighthouse
[WARNING]: Found both group and host with same name: vector

PLAY [Deploy ClickHouse, Vector, Lighthouse] *********************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************
[WARNING]: Platform linux on host lighthouse is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could change the meaning of
that path. See https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [lighthouse]
[WARNING]: Platform linux on host clickhouse is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could change the meaning of
that path. See https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [clickhouse]
[WARNING]: Platform linux on host vector is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could change the meaning of that
path. See https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [vector]

TASK [Install common dependencies (curl, gnupg, etc.)] ***********************************************************************************************************************************************
ok: [vector]
ok: [clickhouse]
ok: [lighthouse]

PLAY [Install Clickhouse] ****************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************
ok: [clickhouse]

TASK [Add ClickHouse GPG key] ************************************************************************************************************************************************************************
ok: [clickhouse]

TASK [Add ClickHouse repository] *********************************************************************************************************************************************************************
ok: [clickhouse]

TASK [Update apt cache] ******************************************************************************************************************************************************************************
changed: [clickhouse]

TASK [Install ClickHouse packages] *******************************************************************************************************************************************************************
ok: [clickhouse]

TASK [Ensure ClickHouse service is enabled and started] **********************************************************************************************************************************************
ok: [clickhouse]

TASK [Display ClickHouse version] ********************************************************************************************************************************************************************
ok: [clickhouse] => {
    "clickhouse_version_check.stdout": "VARIABLE IS NOT DEFINED!"
}

TASK [Copy ClickHouse config] ************************************************************************************************************************************************************************
ok: [clickhouse]

TASK [Copy ClickHouse users] *************************************************************************************************************************************************************************
ok: [clickhouse]

TASK [Create database] *******************************************************************************************************************************************************************************
skipping: [clickhouse]

TASK [Create Clickhouse table] ***********************************************************************************************************************************************************************
skipping: [clickhouse]

PLAY [Install Vector] ********************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************
ok: [vector]

TASK [Create vector work directory] ******************************************************************************************************************************************************************
ok: [vector]

TASK [Get Vector distrib] ****************************************************************************************************************************************************************************
ok: [vector]

TASK [Install Vector] ********************************************************************************************************************************************************************************
ok: [vector]

TASK [Check Vector installation] *********************************************************************************************************************************************************************
skipping: [vector]

TASK [Deploy Vector config] **************************************************************************************************************************************************************************
ok: [vector]

TASK [Enable and start Vector] ***********************************************************************************************************************************************************************
ok: [vector]

PLAY [Install and Configure Lighthouse] **************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************
ok: [lighthouse]

TASK [Install Nginx] *********************************************************************************************************************************************************************************
ok: [lighthouse]

TASK [Clone Lighthouse repository] *******************************************************************************************************************************************************************
ok: [lighthouse]

TASK [Prepare nginx config] **************************************************************************************************************************************************************************
changed: [lighthouse]

RUNNING HANDLER [Restart Nginx] **********************************************************************************************************************************************************************
changed: [lighthouse]

PLAY RECAP *******************************************************************************************************************************************************************************************
clickhouse                 : ok=11   changed=1    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0   
lighthouse                 : ok=7    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
vector                     : ok=8    changed=0    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
```
#### 7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
```shell
glubuchik@glubuchik-X15-AT-22:~/обучение/ansible/08-ansible-03-yandex/playbook$ ansible-playbook -i ./inventory/virtualbox.yml site.yml --diff
[WARNING]: Found both group and host with same name: clickhouse
[WARNING]: Found both group and host with same name: lighthouse
[WARNING]: Found both group and host with same name: vector

PLAY [Deploy ClickHouse, Vector, Lighthouse] *********************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************
[WARNING]: Platform linux on host lighthouse is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could change the meaning of
that path. See https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [lighthouse]
[WARNING]: Platform linux on host clickhouse is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could change the meaning of
that path. See https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [clickhouse]
[WARNING]: Platform linux on host vector is using the discovered Python interpreter at /usr/bin/python3.12, but future installation of another Python interpreter could change the meaning of that
path. See https://docs.ansible.com/ansible-core/2.17/reference_appendices/interpreter_discovery.html for more information.
ok: [vector]

TASK [Install common dependencies (curl, gnupg, etc.)] ***********************************************************************************************************************************************
ok: [lighthouse]
ok: [clickhouse]
ok: [vector]

PLAY [Install Clickhouse] ****************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************
ok: [clickhouse]

TASK [Add ClickHouse GPG key] ************************************************************************************************************************************************************************
ok: [clickhouse]

TASK [Add ClickHouse repository] *********************************************************************************************************************************************************************
ok: [clickhouse]

TASK [Update apt cache] ******************************************************************************************************************************************************************************
changed: [clickhouse]

TASK [Install ClickHouse packages] *******************************************************************************************************************************************************************
ok: [clickhouse]

TASK [Ensure ClickHouse service is enabled and started] **********************************************************************************************************************************************
ok: [clickhouse]

TASK [Display ClickHouse version] ********************************************************************************************************************************************************************
ok: [clickhouse] => {
    "clickhouse_version_check.stdout": "VARIABLE IS NOT DEFINED!"
}

TASK [Copy ClickHouse config] ************************************************************************************************************************************************************************
ok: [clickhouse]

TASK [Copy ClickHouse users] *************************************************************************************************************************************************************************
ok: [clickhouse]

TASK [Create database] *******************************************************************************************************************************************************************************
changed: [clickhouse]

TASK [Create Clickhouse table] ***********************************************************************************************************************************************************************
ok: [clickhouse]

PLAY [Install Vector] ********************************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************
ok: [vector]

TASK [Create vector work directory] ******************************************************************************************************************************************************************
ok: [vector]

TASK [Get Vector distrib] ****************************************************************************************************************************************************************************
ok: [vector]

TASK [Install Vector] ********************************************************************************************************************************************************************************
ok: [vector]

TASK [Check Vector installation] *********************************************************************************************************************************************************************
changed: [vector]

TASK [Deploy Vector config] **************************************************************************************************************************************************************************
ok: [vector]

TASK [Enable and start Vector] ***********************************************************************************************************************************************************************
ok: [vector]

PLAY [Install and Configure Lighthouse] **************************************************************************************************************************************************************

TASK [Gathering Facts] *******************************************************************************************************************************************************************************
ok: [lighthouse]

TASK [Install Nginx] *********************************************************************************************************************************************************************************
ok: [lighthouse]

TASK [Clone Lighthouse repository] *******************************************************************************************************************************************************************
ok: [lighthouse]

TASK [Prepare nginx config] **************************************************************************************************************************************************************************
ok: [lighthouse]

PLAY RECAP *******************************************************************************************************************************************************************************************
clickhouse                 : ok=13   changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
lighthouse                 : ok=6    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
vector                     : ok=9    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
```

#### 8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
#### 9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
В [site.yml](playbook%2Fsite.yml) добавлен PLAY с `tags=lighthouse`, устанавливающий lighthouse.  

Для работы с ВМ подготовлен ```inventory``` [virtualbox.yml](playbook%2Finventory%2Fvirtualbox.yml).  

Подготовленные ВМ:    

| Hostname          |       IP      | Software           |
|-------------------|---------------|--------------------|
| clickhouse        | 192.168.1.102 | Clickhouse         |
| vector            | 192.168.1.63  | Vector             |
| lighthouse        | 192.168.1.128 | Lighthouse & Nginx | 

Vector генерирует данные для отправки в БД Clickhouse с помощью источника данных `type: demo_logs`. 
Шаблон конфига [vector.toml.j2](playbook%2Ftemplates%2Fvector.toml.j2)

[site.yml](playbook%2Fsite.yml) содержит 3 play'я task'ов. Каждый Play содержит в себе task'и по установке 
Clickhouse, Vector и Lighthouse соответственно. Каждый play можно выполнить отдельно, используя тэги: `clickhouse`, 
`vector` и `lighthouse`.  
Плейбук использует 4 файла с переменными: 3 файла для каждой из групп хостов индивидуально:  
- [clickhouse_vars.yml](playbook%2Fgroup_vars%2Fclickhouse%2Fvars.yml)  
- [vector_vars.yml](playbook%2Fgroup_vars%2Fvector%2Fvars.yml)
- [lighthouse_vars.yml](playbook%2Fgroup_vars%2Flighthouse%2Fvars.yml) 

и один файл, применяемый для всез групп хостов:  
- [all_vars.yml](playbook%2Fgroup_vars%2Fall.yml)    

Для конфигурации Clickhouse, Vector и Nginx используются шаблоны конфигов:
- [config.xml.j2](playbook%2Ftemplates%2Fclickhouse%2Fconfig.xml.j2)
- [vector.toml.j2](playbook%2Ftemplates%2Fvector.toml.j2)
- [lighthouse.conf.j2](playbook%2Ftemplates%2Flighthouse%2Flighthouse.conf.j2)

#### 10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---
