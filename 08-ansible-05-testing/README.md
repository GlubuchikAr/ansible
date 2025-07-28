# Домашнее задание к занятию 5 «Тестирование roles»

## Подготовка к выполнению

1. Установите molecule и его драйвера: `pip3 install "molecule molecule_docker molecule_podman`.
2. Выполните `docker pull aragast/netology:latest` —  это образ с podman, tox и несколькими пайтонами (3.7 и 3.9) внутри.

## Основная часть

Ваша цель — настроить тестирование ваших ролей. 

Задача — сделать сценарии тестирования для vector. 

Ожидаемый результат — все сценарии успешно проходят тестирование ролей.

### Molecule

1. Запустите  `molecule test -s ubuntu_xenial` (или с любым другим сценарием, не имеет значения) внутри корневой директории clickhouse-role, посмотрите на вывод команды. Данная команда может отработать с ошибками или не отработать вовсе, это нормально. Наша цель - посмотреть как другие в реальном мире используют молекулу И из чего может состоять сценарий тестирования.
<details>
<summary>molecule test -s ubuntu_xenial</summary> 

```bash
(venv) glubuchik@glubuchik-X15-AT-22:~/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/clickhouse$ molecule test -s ubuntu_xenial
WARNING  The scenario config file ('/home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/clickhouse/molecule/ubuntu_xenial/molecule.yml') has been modified since the scenario was created. If recent changes are important, reset the scenario with 'molecule destroy' to clean up created items or 'molecule reset' to clear current configuration.
WARNING  Driver docker does not provide a schema.
INFO     ubuntu_xenial scenario test matrix: dependency, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun with role_name_check=0...
INFO     Running ubuntu_xenial > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running ubuntu_xenial > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running ubuntu_xenial > destroy
INFO     ansible-playbook version: ansible-playbook 
  config file = None
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=ubuntu_xenial)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
ok: [localhost] => (item=ubuntu_xenial)

TASK [Delete docker networks(s)] ***********************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running ubuntu_xenial > syntax
INFO     ansible-playbook version: ansible-playbook 
  config file = None
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True

playbook: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/clickhouse/molecule/resources/playbooks/converge.yml
INFO     Running ubuntu_xenial > create
INFO     ansible-playbook version: ansible-playbook 
  config file = None
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True

PLAY [Create] ******************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None) 
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'sudo', 'container': 'docker'}, 'image': 'ubuntu:xenial', 'name': 'ubuntu_xenial', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Create Dockerfiles from image names] *************************************
changed: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'sudo', 'container': 'docker'}, 'image': 'ubuntu:xenial', 'name': 'ubuntu_xenial', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Synchronization the context] *********************************************
changed: [localhost] => (item={'capabilities': ['SYS_ADMIN'], 'command': '/sbin/init', 'dockerfile': '../resources/Dockerfile.j2', 'env': {'ANSIBLE_USER': 'ansible', 'DEPLOY_GROUP': 'deployer', 'SUDO_GROUP': 'sudo', 'container': 'docker'}, 'image': 'ubuntu:xenial', 'name': 'ubuntu_xenial', 'privileged': True, 'tmpfs': ['/run', '/tmp'], 'volumes': ['/sys/fs/cgroup:/sys/fs/cgroup']})

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item=None)
ok: [localhost]

TASK [Build an Ansible compatible image (new)] *********************************
changed: [localhost] => (item=molecule_local/ubuntu:xenial)

TASK [Create docker network(s)] ************************************************
skipping: [localhost]

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item=None)
ok: [localhost]

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=ubuntu_xenial)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item=None)
changed: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=9    changed=5    unreachable=0    failed=0    skipped=2    rescued=0    ignored=0

INFO     Running ubuntu_xenial > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running ubuntu_xenial > converge
INFO     ansible-playbook version: ansible-playbook 
  config file = None
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
fatal: [ubuntu_xenial]: FAILED! => {"ansible_facts": {}, "changed": false, "failed_modules": {"ansible.legacy.setup": {"ansible_facts": {"discovered_interpreter_python": "/usr/bin/python3"}, "exception": "Traceback (most recent call last):\n  File \"/home/ansible/.ansible/tmp/ansible-tmp-1753632065.015764-590043-194054431325811/AnsiballZ_setup.py\", line 107, in <module>\n    _ansiballz_main()\n  File \"/home/ansible/.ansible/tmp/ansible-tmp-1753632065.015764-590043-194054431325811/AnsiballZ_setup.py\", line 99, in _ansiballz_main\n    invoke_module(zipped_mod, temp_path, ANSIBALLZ_PARAMS)\n  File \"/home/ansible/.ansible/tmp/ansible-tmp-1753632065.015764-590043-194054431325811/AnsiballZ_setup.py\", line 44, in invoke_module\n    from ansible.module_utils import basic\n  File \"<frozen importlib._bootstrap>\", line 969, in _find_and_load\n  File \"<frozen importlib._bootstrap>\", line 954, in _find_and_load_unlocked\n  File \"<frozen importlib._bootstrap>\", line 896, in _find_spec\n  File \"<frozen importlib._bootstrap_external>\", line 1139, in find_spec\n  File \"<frozen importlib._bootstrap_external>\", line 1115, in _get_spec\n  File \"<frozen importlib._bootstrap_external>\", line 1096, in _legacy_get_spec\n  File \"<frozen importlib._bootstrap>\", line 444, in spec_from_loader\n  File \"<frozen importlib._bootstrap_external>\", line 533, in spec_from_file_location\n  File \"/tmp/ansible_ansible.legacy.setup_payload_8e8845dq/ansible_ansible.legacy.setup_payload.zip/ansible/module_utils/basic.py\", line 17\n    msg=f\"ansible-core requires a minimum of Python version {'.'.join(map(str, _PY_MIN))}. Current version: {''.join(sys.version.splitlines())}\",\n                                                                                                                                               ^\nSyntaxError: invalid syntax\n", "failed": true, "module_stderr": "Traceback (most recent call last):\n  File \"/home/ansible/.ansible/tmp/ansible-tmp-1753632065.015764-590043-194054431325811/AnsiballZ_setup.py\", line 107, in <module>\n    _ansiballz_main()\n  File \"/home/ansible/.ansible/tmp/ansible-tmp-1753632065.015764-590043-194054431325811/AnsiballZ_setup.py\", line 99, in _ansiballz_main\n    invoke_module(zipped_mod, temp_path, ANSIBALLZ_PARAMS)\n  File \"/home/ansible/.ansible/tmp/ansible-tmp-1753632065.015764-590043-194054431325811/AnsiballZ_setup.py\", line 44, in invoke_module\n    from ansible.module_utils import basic\n  File \"<frozen importlib._bootstrap>\", line 969, in _find_and_load\n  File \"<frozen importlib._bootstrap>\", line 954, in _find_and_load_unlocked\n  File \"<frozen importlib._bootstrap>\", line 896, in _find_spec\n  File \"<frozen importlib._bootstrap_external>\", line 1139, in find_spec\n  File \"<frozen importlib._bootstrap_external>\", line 1115, in _get_spec\n  File \"<frozen importlib._bootstrap_external>\", line 1096, in _legacy_get_spec\n  File \"<frozen importlib._bootstrap>\", line 444, in spec_from_loader\n  File \"<frozen importlib._bootstrap_external>\", line 533, in spec_from_file_location\n  File \"/tmp/ansible_ansible.legacy.setup_payload_8e8845dq/ansible_ansible.legacy.setup_payload.zip/ansible/module_utils/basic.py\", line 17\n    msg=f\"ansible-core requires a minimum of Python version {'.'.join(map(str, _PY_MIN))}. Current version: {''.join(sys.version.splitlines())}\",\n                                                                                                                                               ^\nSyntaxError: invalid syntax\n", "module_stdout": "", "msg": "MODULE FAILURE: No start of json char found\nSee stdout/stderr for the exact error", "rc": 1}}, "msg": "The following modules failed to execute: ansible.legacy.setup\n"}

PLAY RECAP *********************************************************************
ubuntu_xenial              : ok=0    changed=0    unreachable=0    failed=1    skipped=0    rescued=0    ignored=0

CRITICAL Ansible return code was 2, command was: ansible-playbook -D --inventory /home/glubuchik/.ansible/tmp/molecule.fgmf.ubuntu_xenial/inventory --skip-tags molecule-notest,notest '/home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/clickhouse/molecule/resources/playbooks/converge.yml'
WARNING  An error occurred during the test sequence action: 'converge'. Cleaning up.
INFO     Running ubuntu_xenial > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running ubuntu_xenial > destroy
INFO     ansible-playbook version: ansible-playbook 
  config file = None
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=ubuntu_xenial)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item=ubuntu_xenial)

TASK [Delete docker networks(s)] ***********************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
```
</details>

2. Перейдите в каталог с ролью vector-role и создайте сценарий тестирования по умолчанию при помощи `molecule init scenario --driver-name docker`.
<details>
<summary>molecule init scenario -d docker</summary> 

```bash
(venv) glubuchik@glubuchik-X15-AT-22:~/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector$ molecule init scenario -d docker
INFO     Initializing new scenario default...

PLAY [Create a new molecule scenario] ******************************************

TASK [Check if destination folder exists] **************************************
changed: [localhost]

TASK [Check if destination folder is empty] ************************************
ok: [localhost]

TASK [Fail if destination folder is not empty] *********************************
skipping: [localhost]

TASK [Expand templates] ********************************************************
changed: [localhost] => (item=molecule/default/molecule.yml)
skipping: [localhost] => (item=molecule/default/destroy.yml) 
skipping: [localhost] => (item=molecule/default/create.yml) 
changed: [localhost] => (item=molecule/default/converge.yml)

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Initialized scenario in /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/molecule/default successfully.
```
</details>

3. Добавьте несколько разных дистрибутивов (oraclelinux:8, ubuntu:latest) для инстансов и протестируйте роль, исправьте найденные ошибки, если они есть.
<details>
<summary>molecule test</summary> 

```bash
(venv) glubuchik@glubuchik-X15-AT-22:~/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector$ molecule test
WARNING  Driver docker does not provide a schema.
INFO     default scenario test matrix: dependency, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun with role_name_check=0...
INFO     Running default > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     ansible-playbook version: ansible-playbook 
  config file = None
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=ubuntu)
changed: [localhost] => (item=fedora)

TASK [Wait for instance(s) deletion to complete] *******************************
ok: [localhost] => (item=ubuntu)
ok: [localhost] => (item=fedora)

TASK [Delete docker networks(s)] ***********************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax
INFO     ansible-playbook version: ansible-playbook 
  config file = None
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True

playbook: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/molecule/default/converge.yml
INFO     Running default > create
INFO     ansible-playbook version: ansible-playbook 
  config file = None
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True

PLAY [Create] ******************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None) 
skipping: [localhost] => (item=None) 
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'image': 'geerlingguy/docker-ubuntu2004-ansible', 'name': 'ubuntu', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/fedora:latest', 'name': 'fedora', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item={'image': 'geerlingguy/docker-ubuntu2004-ansible', 'name': 'ubuntu', 'pre_build_image': True}) 
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/fedora:latest', 'name': 'fedora', 'pre_build_image': True}) 
skipping: [localhost]

TASK [Synchronization the context] *********************************************
skipping: [localhost] => (item={'image': 'geerlingguy/docker-ubuntu2004-ansible', 'name': 'ubuntu', 'pre_build_image': True}) 
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/fedora:latest', 'name': 'fedora', 'pre_build_image': True}) 
skipping: [localhost]

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'false_condition': 'not item.pre_build_image | default(false)', 'item': {'image': 'geerlingguy/docker-ubuntu2004-ansible', 'name': 'ubuntu', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'false_condition': 'not item.pre_build_image | default(false)', 'item': {'image': 'docker.io/pycontribs/fedora:latest', 'name': 'fedora', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 1, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
skipping: [localhost] => (item=molecule_local/geerlingguy/docker-ubuntu2004-ansible) 
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/fedora:latest) 
skipping: [localhost]

TASK [Create docker network(s)] ************************************************
skipping: [localhost]

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'image': 'geerlingguy/docker-ubuntu2004-ansible', 'name': 'ubuntu', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/fedora:latest', 'name': 'fedora', 'pre_build_image': True})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=ubuntu)
changed: [localhost] => (item=fedora)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': 'j575711665271.1125283', 'results_file': '/home/glubuchik/.ansible_async/j575711665271.1125283', 'changed': True, 'item': {'image': 'geerlingguy/docker-ubuntu2004-ansible', 'name': 'ubuntu', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': 'j445211788686.1125308', 'results_file': '/home/glubuchik/.ansible_async/j445211788686.1125308', 'changed': True, 'item': {'image': 'docker.io/pycontribs/fedora:latest', 'name': 'fedora', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=6    changed=2    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge
INFO     ansible-playbook version: ansible-playbook 
  config file = None
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [ubuntu]
ok: [fedora]

TASK [Include vector role] *****************************************************
included: ../../../../vector for fedora, ubuntu

TASK [../../../../vector : Vector| Install package] ****************************
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/tasks/install_dnf.yml for fedora
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/tasks/install_apt.yml for ubuntu

TASK [../../../../vector : Install Vector | Get Vector distrib] ****************
changed: [fedora]

TASK [../../../../vector : Install Vector | RPM install] ***********************
changed: [fedora]

TASK [../../../../vector : Install Vector | Get Vector distrib] ****************
changed: [ubuntu]

TASK [../../../../vector : Install Vector | DEB install] ***********************
changed: [ubuntu]

TASK [../../../../vector : Vector | Configure vector] **************************
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/tasks/configure_vector.yml for fedora, ubuntu

TASK [../../../../vector : Configure Vector | ensure what directory exists] ****
changed: [ubuntu]
changed: [fedora]

TASK [../../../../vector : Configure Vector | Template config] *****************
changed: [fedora]
changed: [ubuntu]

TASK [../../../../vector : Vector | Configure service] *************************
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/tasks/configure_service.yml for fedora, ubuntu

TASK [../../../../vector : Ensure systemd system directory exists] *************
ok: [ubuntu]
changed: [fedora]

TASK [../../../../vector : Configure Service | Template systemd unit] **********
changed: [fedora]
changed: [ubuntu]

RUNNING HANDLER [../../../../vector : restart vector service] ******************
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/handlers/restart_vector.yml for fedora

RUNNING HANDLER [../../../../vector : Try systemd restart (if available)] ******
skipping: [fedora]

RUNNING HANDLER [../../../../vector : Fallback to manual restart if systemd failed] ***
[WARNING]: As of Ansible 2.4, the parameter 'executable' is no longer supported
with the 'command' module. Not using '/bin/bash'.
changed: [fedora]

PLAY RECAP *********************************************************************
fedora                     : ok=13   changed=7    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
ubuntu                     : ok=11   changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running default > idempotence
INFO     ansible-playbook version: ansible-playbook 
  config file = None
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [ubuntu]
ok: [fedora]

TASK [Include vector role] *****************************************************
included: ../../../../vector for fedora, ubuntu

TASK [../../../../vector : Vector| Install package] ****************************
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/tasks/install_dnf.yml for fedora
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/tasks/install_apt.yml for ubuntu

TASK [../../../../vector : Install Vector | Get Vector distrib] ****************
ok: [fedora]

TASK [../../../../vector : Install Vector | RPM install] ***********************
ok: [fedora]

TASK [../../../../vector : Install Vector | Get Vector distrib] ****************
ok: [ubuntu]

TASK [../../../../vector : Install Vector | DEB install] ***********************
ok: [ubuntu]

TASK [../../../../vector : Vector | Configure vector] **************************
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/tasks/configure_vector.yml for fedora, ubuntu

TASK [../../../../vector : Configure Vector | ensure what directory exists] ****
ok: [ubuntu]
ok: [fedora]

TASK [../../../../vector : Configure Vector | Template config] *****************
ok: [ubuntu]
ok: [fedora]

TASK [../../../../vector : Vector | Configure service] *************************
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/tasks/configure_service.yml for fedora, ubuntu

TASK [../../../../vector : Ensure systemd system directory exists] *************
ok: [fedora]
ok: [ubuntu]

TASK [../../../../vector : Configure Service | Template systemd unit] **********
ok: [ubuntu]
ok: [fedora]

PLAY RECAP *********************************************************************
fedora                     : ok=11   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu                     : ok=11   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Idempotence completed successfully.
INFO     Running default > side_effect
WARNING  Skipping, side effect playbook not configured.
INFO     Running default > verify
INFO     Running Ansible Verifier
INFO     ansible-playbook version: ansible-playbook 
  config file = /home/glubuchik/.ansible/tmp/molecule.sNUc.default/ansible.cfg
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True

PLAY [Verify] ******************************************************************

TASK [Example assertion] *******************************************************
ok: [fedora] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [ubuntu] => {
    "changed": false,
    "msg": "All assertions passed"
}

PLAY RECAP *********************************************************************
fedora                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Verifier completed successfully.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     ansible-playbook version: ansible-playbook 
  config file = /home/glubuchik/.ansible/tmp/molecule.sNUc.default/ansible.cfg
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=ubuntu)
changed: [localhost] => (item=fedora)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item=ubuntu)
changed: [localhost] => (item=fedora)

TASK [Delete docker networks(s)] ***********************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
```
</details>

4. Добавьте несколько assert в verify.yml-файл для  проверки работоспособности vector-role (проверка, что конфиг валидный, проверка успешности запуска и др.). 
<details>
<summary>verify.yml</summary> 

```bash
---
- name: Verify
  hosts: all
  gather_facts: false
  tasks:
  - name: Example assertion
    assert:
      that: true
```
</details>

5. Запустите тестирование роли повторно и проверьте, что оно прошло успешно.
<details>
<summary>molecule test</summary> 

```bash
(venv) glubuchik@glubuchik-X15-AT-22:~/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector$ molecule test
WARNING  Driver docker does not provide a schema.
INFO     default scenario test matrix: dependency, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, destroy
INFO     Performing prerun with role_name_check=0...
INFO     Running default > dependency
WARNING  Skipping, missing the requirements file.
WARNING  Skipping, missing the requirements file.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     ansible-playbook version: ansible-playbook 
  config file = None
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True
INFO     Sanity checks: 'docker'

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=ubuntu)
changed: [localhost] => (item=fedora)

TASK [Wait for instance(s) deletion to complete] *******************************
ok: [localhost] => (item=ubuntu)
ok: [localhost] => (item=fedora)

TASK [Delete docker networks(s)] ***********************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=1    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Running default > syntax
INFO     ansible-playbook version: ansible-playbook 
  config file = None
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True

playbook: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/molecule/default/converge.yml
INFO     Running default > create
INFO     ansible-playbook version: ansible-playbook 
  config file = None
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True

PLAY [Create] ******************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Log into a Docker registry] **********************************************
skipping: [localhost] => (item=None) 
skipping: [localhost] => (item=None) 
skipping: [localhost]

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item={'image': 'geerlingguy/docker-ubuntu2004-ansible', 'name': 'ubuntu', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/fedora:latest', 'name': 'fedora', 'pre_build_image': True})

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item={'image': 'geerlingguy/docker-ubuntu2004-ansible', 'name': 'ubuntu', 'pre_build_image': True}) 
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/fedora:latest', 'name': 'fedora', 'pre_build_image': True}) 
skipping: [localhost]

TASK [Synchronization the context] *********************************************
skipping: [localhost] => (item={'image': 'geerlingguy/docker-ubuntu2004-ansible', 'name': 'ubuntu', 'pre_build_image': True}) 
skipping: [localhost] => (item={'image': 'docker.io/pycontribs/fedora:latest', 'name': 'fedora', 'pre_build_image': True}) 
skipping: [localhost]

TASK [Discover local Docker images] ********************************************
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'false_condition': 'not item.pre_build_image | default(false)', 'item': {'image': 'geerlingguy/docker-ubuntu2004-ansible', 'name': 'ubuntu', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 0, 'ansible_index_var': 'i'})
ok: [localhost] => (item={'changed': False, 'skipped': True, 'skip_reason': 'Conditional result was False', 'false_condition': 'not item.pre_build_image | default(false)', 'item': {'image': 'docker.io/pycontribs/fedora:latest', 'name': 'fedora', 'pre_build_image': True}, 'ansible_loop_var': 'item', 'i': 1, 'ansible_index_var': 'i'})

TASK [Build an Ansible compatible image (new)] *********************************
skipping: [localhost] => (item=molecule_local/geerlingguy/docker-ubuntu2004-ansible) 
skipping: [localhost] => (item=molecule_local/docker.io/pycontribs/fedora:latest) 
skipping: [localhost]

TASK [Create docker network(s)] ************************************************
skipping: [localhost]

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item={'image': 'geerlingguy/docker-ubuntu2004-ansible', 'name': 'ubuntu', 'pre_build_image': True})
ok: [localhost] => (item={'image': 'docker.io/pycontribs/fedora:latest', 'name': 'fedora', 'pre_build_image': True})

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=ubuntu)
changed: [localhost] => (item=fedora)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': 'j575711665271.1125283', 'results_file': '/home/glubuchik/.ansible_async/j575711665271.1125283', 'changed': True, 'item': {'image': 'geerlingguy/docker-ubuntu2004-ansible', 'name': 'ubuntu', 'pre_build_image': True}, 'ansible_loop_var': 'item'})
changed: [localhost] => (item={'failed': 0, 'started': 1, 'finished': 0, 'ansible_job_id': 'j445211788686.1125308', 'results_file': '/home/glubuchik/.ansible_async/j445211788686.1125308', 'changed': True, 'item': {'image': 'docker.io/pycontribs/fedora:latest', 'name': 'fedora', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=6    changed=2    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0

INFO     Running default > prepare
WARNING  Skipping, prepare playbook not configured.
INFO     Running default > converge
INFO     ansible-playbook version: ansible-playbook 
  config file = None
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [ubuntu]
ok: [fedora]

TASK [Include vector role] *****************************************************
included: ../../../../vector for fedora, ubuntu

TASK [../../../../vector : Vector| Install package] ****************************
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/tasks/install_dnf.yml for fedora
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/tasks/install_apt.yml for ubuntu

TASK [../../../../vector : Install Vector | Get Vector distrib] ****************
changed: [fedora]

TASK [../../../../vector : Install Vector | RPM install] ***********************
changed: [fedora]

TASK [../../../../vector : Install Vector | Get Vector distrib] ****************
changed: [ubuntu]

TASK [../../../../vector : Install Vector | DEB install] ***********************
changed: [ubuntu]

TASK [../../../../vector : Vector | Configure vector] **************************
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/tasks/configure_vector.yml for fedora, ubuntu

TASK [../../../../vector : Configure Vector | ensure what directory exists] ****
changed: [ubuntu]
changed: [fedora]

TASK [../../../../vector : Configure Vector | Template config] *****************
changed: [fedora]
changed: [ubuntu]

TASK [../../../../vector : Vector | Configure service] *************************
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/tasks/configure_service.yml for fedora, ubuntu

TASK [../../../../vector : Ensure systemd system directory exists] *************
ok: [ubuntu]
changed: [fedora]

TASK [../../../../vector : Configure Service | Template systemd unit] **********
changed: [fedora]
changed: [ubuntu]

RUNNING HANDLER [../../../../vector : restart vector service] ******************
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/handlers/restart_vector.yml for fedora

RUNNING HANDLER [../../../../vector : Try systemd restart (if available)] ******
skipping: [fedora]

RUNNING HANDLER [../../../../vector : Fallback to manual restart if systemd failed] ***
[WARNING]: As of Ansible 2.4, the parameter 'executable' is no longer supported
with the 'command' module. Not using '/bin/bash'.
changed: [fedora]

PLAY RECAP *********************************************************************
fedora                     : ok=13   changed=7    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0
ubuntu                     : ok=11   changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running default > idempotence
INFO     ansible-playbook version: ansible-playbook 
  config file = None
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True

PLAY [Converge] ****************************************************************

TASK [Gathering Facts] *********************************************************
ok: [ubuntu]
ok: [fedora]

TASK [Include vector role] *****************************************************
included: ../../../../vector for fedora, ubuntu

TASK [../../../../vector : Vector| Install package] ****************************
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/tasks/install_dnf.yml for fedora
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/tasks/install_apt.yml for ubuntu

TASK [../../../../vector : Install Vector | Get Vector distrib] ****************
ok: [fedora]

TASK [../../../../vector : Install Vector | RPM install] ***********************
ok: [fedora]

TASK [../../../../vector : Install Vector | Get Vector distrib] ****************
ok: [ubuntu]

TASK [../../../../vector : Install Vector | DEB install] ***********************
ok: [ubuntu]

TASK [../../../../vector : Vector | Configure vector] **************************
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/tasks/configure_vector.yml for fedora, ubuntu

TASK [../../../../vector : Configure Vector | ensure what directory exists] ****
ok: [ubuntu]
ok: [fedora]

TASK [../../../../vector : Configure Vector | Template config] *****************
ok: [ubuntu]
ok: [fedora]

TASK [../../../../vector : Vector | Configure service] *************************
included: /home/glubuchik/обучение/Netology/ansible/08-ansible-05-testing/playbook/roles/vector/tasks/configure_service.yml for fedora, ubuntu

TASK [../../../../vector : Ensure systemd system directory exists] *************
ok: [fedora]
ok: [ubuntu]

TASK [../../../../vector : Configure Service | Template systemd unit] **********
ok: [ubuntu]
ok: [fedora]

PLAY RECAP *********************************************************************
fedora                     : ok=11   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu                     : ok=11   changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Idempotence completed successfully.
INFO     Running default > side_effect
WARNING  Skipping, side effect playbook not configured.
INFO     Running default > verify
INFO     Running Ansible Verifier
INFO     ansible-playbook version: ansible-playbook 
  config file = /home/glubuchik/.ansible/tmp/molecule.sNUc.default/ansible.cfg
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True

PLAY [Verify] ******************************************************************

TASK [Example assertion] *******************************************************
ok: [fedora] => {
    "changed": false,
    "msg": "All assertions passed"
}
ok: [ubuntu] => {
    "changed": false,
    "msg": "All assertions passed"
}

PLAY RECAP *********************************************************************
fedora                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
ubuntu                     : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Verifier completed successfully.
INFO     Running default > cleanup
WARNING  Skipping, cleanup playbook not configured.
INFO     Running default > destroy
INFO     ansible-playbook version: ansible-playbook 
  config file = /home/glubuchik/.ansible/tmp/molecule.sNUc.default/ansible.cfg
  configured module search path = ['/home/glubuchik/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /home/glubuchik/обучение/Netology/ansible/venv/lib/python3.12/site-packages/ansible
  ansible collection location = /home/glubuchik/.ansible/collections:/usr/share/ansible/collections
  executable location = /home/glubuchik/обучение/Netology/ansible/venv/bin/ansible-playbook
  python version = 3.12.3 (main, Jun 18 2025, 17:59:45) [GCC 13.3.0] (/home/glubuchik/обучение/Netology/ansible/venv/bin/python3)
  jinja version = 3.1.6
  libyaml = True

PLAY [Destroy] *****************************************************************

TASK [Set async_dir for HOME env] **********************************************
ok: [localhost]

TASK [Destroy molecule instance(s)] ********************************************
changed: [localhost] => (item=ubuntu)
changed: [localhost] => (item=fedora)

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: [localhost]: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item=ubuntu)
changed: [localhost] => (item=fedora)

TASK [Delete docker networks(s)] ***********************************************
skipping: [localhost]

PLAY RECAP *********************************************************************
localhost                  : ok=3    changed=2    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
```
</details>

6. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

### Tox

1. Добавьте в директорию с vector-role файлы из [директории](./example).
2. Запустите `docker run --privileged=True -v <path_to_repo>:/opt/vector-role -w /opt/vector-role -it aragast/netology:latest /bin/bash`, где path_to_repo — путь до корня репозитория с vector-role на вашей файловой системе.
3. Внутри контейнера выполните команду `tox`, посмотрите на вывод.
<details>
<summary>tox</summary> 

```bash
[root@482286654ae4 vector-role]# tox
py37-ansible210 create: /opt/vector-role/.tox/py37-ansible210
py37-ansible210 installdeps: -rtox-requirements.txt, ansible<3.0
py37-ansible210 installed: ansible==2.10.7,ansible-base==2.10.17,ansible-compat==1.0.0,arrow==1.2.3,bcrypt==4.2.1,binaryornot==0.4.4,cached-property==1.5.2,Cerberus==1.3.7,certifi==2025.7.14,cffi==1.15.1,chardet==5.2.0,charset-normalizer==3.4.2,click==8.1.8,click-help-colors==0.9.4,cookiecutter==2.6.0,cryptography==45.0.5,distro==1.9.0,enrich==1.2.7,idna==3.10,importlib-metadata==6.7.0,Jinja2==3.1.6,jmespath==1.0.1,lxml==5.4.0,markdown-it-py==2.2.0,MarkupSafe==2.1.5,mdurl==0.1.2,molecule==3.6.1,molecule-podman==1.1.0,packaging==24.0,paramiko==2.12.0,pluggy==1.2.0,pycparser==2.21,Pygments==2.17.2,PyNaCl==1.5.0,python-dateutil==2.9.0.post0,python-slugify==8.0.4,PyYAML==6.0.1,requests==2.31.0,rich==13.8.1,selinux==0.2.1,six==1.17.0,subprocess-tee==0.3.5,text-unidecode==1.3,typing_extensions==4.7.1,urllib3==2.0.7,zipp==3.15.0
py37-ansible210 run-test-pre: PYTHONHASHSEED='715305609'
py37-ansible210 run-test: commands[0] | molecule test -s compatibility --destroy always
/opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.7 is no longer supported by the Python core team and support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.7.
  from cryptography.exceptions import InvalidSignature
CRITICAL 'molecule/compatibility/molecule.yml' glob failed.  Exiting.
ERROR: InvocationError for command /opt/vector-role/.tox/py37-ansible210/bin/molecule test -s compatibility --destroy always (exited with code 1)
py37-ansible30 create: /opt/vector-role/.tox/py37-ansible30
py37-ansible30 installdeps: -rtox-requirements.txt, ansible<3.1
py37-ansible30 installed: ansible==3.0.0,ansible-base==2.10.17,ansible-compat==1.0.0,arrow==1.2.3,bcrypt==4.2.1,binaryornot==0.4.4,cached-property==1.5.2,Cerberus==1.3.7,certifi==2025.7.14,cffi==1.15.1,chardet==5.2.0,charset-normalizer==3.4.2,click==8.1.8,click-help-colors==0.9.4,cookiecutter==2.6.0,cryptography==45.0.5,distro==1.9.0,enrich==1.2.7,idna==3.10,importlib-metadata==6.7.0,Jinja2==3.1.6,jmespath==1.0.1,lxml==5.4.0,markdown-it-py==2.2.0,MarkupSafe==2.1.5,mdurl==0.1.2,molecule==3.6.1,molecule-podman==1.1.0,packaging==24.0,paramiko==2.12.0,pluggy==1.2.0,pycparser==2.21,Pygments==2.17.2,PyNaCl==1.5.0,python-dateutil==2.9.0.post0,python-slugify==8.0.4,PyYAML==6.0.1,requests==2.31.0,rich==13.8.1,selinux==0.2.1,six==1.17.0,subprocess-tee==0.3.5,text-unidecode==1.3,typing_extensions==4.7.1,urllib3==2.0.7,zipp==3.15.0
py37-ansible30 run-test-pre: PYTHONHASHSEED='715305609'
py37-ansible30 run-test: commands[0] | molecule test -s compatibility --destroy always
/opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.7 is no longer supported by the Python core team and support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.7.
  from cryptography.exceptions import InvalidSignature
CRITICAL 'molecule/compatibility/molecule.yml' glob failed.  Exiting.
ERROR: InvocationError for command /opt/vector-role/.tox/py37-ansible30/bin/molecule test -s compatibility --destroy always (exited with code 1)
py39-ansible210 create: /opt/vector-role/.tox/py39-ansible210
py39-ansible210 installdeps: -rtox-requirements.txt, ansible<3.0
py39-ansible210 installed: ansible==2.10.7,ansible-base==2.10.17,ansible-compat==24.10.0,ansible-core==2.15.13,attrs==25.3.0,bracex==2.6,cffi==1.17.1,click==8.1.8,click-help-colors==0.9.4,cryptography==45.0.5,distro==1.9.0,enrich==1.2.7,importlib-resources==5.0.7,Jinja2==3.1.6,jmespath==1.0.1,jsonschema==4.25.0,jsonschema-specifications==2025.4.1,lxml==6.0.0,markdown-it-py==3.0.0,MarkupSafe==3.0.2,mdurl==0.1.2,molecule==6.0.3,molecule-podman==2.0.3,packaging==25.0,pluggy==1.6.0,pycparser==2.22,Pygments==2.19.2,PyYAML==6.0.2,referencing==0.36.2,resolvelib==1.0.1,rich==14.1.0,rpds-py==0.26.0,selinux==0.3.0,subprocess-tee==0.4.2,typing_extensions==4.14.1,wcmatch==10.1
py39-ansible210 run-test-pre: PYTHONHASHSEED='715305609'
py39-ansible210 run-test: commands[0] | molecule test -s compatibility --destroy always
CRITICAL 'molecule/compatibility/molecule.yml' glob failed.  Exiting.
ERROR: InvocationError for command /opt/vector-role/.tox/py39-ansible210/bin/molecule test -s compatibility --destroy always (exited with code 1)
py39-ansible30 create: /opt/vector-role/.tox/py39-ansible30
py39-ansible30 installdeps: -rtox-requirements.txt, ansible<3.1
py39-ansible30 installed: ansible==3.0.0,ansible-base==2.10.17,ansible-compat==24.10.0,ansible-core==2.15.13,attrs==25.3.0,bracex==2.6,cffi==1.17.1,click==8.1.8,click-help-colors==0.9.4,cryptography==45.0.5,distro==1.9.0,enrich==1.2.7,importlib-resources==5.0.7,Jinja2==3.1.6,jmespath==1.0.1,jsonschema==4.25.0,jsonschema-specifications==2025.4.1,lxml==6.0.0,markdown-it-py==3.0.0,MarkupSafe==3.0.2,mdurl==0.1.2,molecule==6.0.3,molecule-podman==2.0.3,packaging==25.0,pluggy==1.6.0,pycparser==2.22,Pygments==2.19.2,PyYAML==6.0.2,referencing==0.36.2,resolvelib==1.0.1,rich==14.1.0,rpds-py==0.26.0,selinux==0.3.0,subprocess-tee==0.4.2,typing_extensions==4.14.1,wcmatch==10.1
py39-ansible30 run-test-pre: PYTHONHASHSEED='715305609'
py39-ansible30 run-test: commands[0] | molecule test -s compatibility --destroy always
CRITICAL 'molecule/compatibility/molecule.yml' glob failed.  Exiting.
ERROR: InvocationError for command /opt/vector-role/.tox/py39-ansible30/bin/molecule test -s compatibility --destroy always (exited with code 1)
________________________________________________________________________________________________________________________________ summary ________________________________________________________________________________________________________________________________
ERROR:   py37-ansible210: commands failed
ERROR:   py37-ansible30: commands failed
ERROR:   py39-ansible210: commands failed
ERROR:   py39-ansible30: commands failed
```
</details>

5. Создайте облегчённый сценарий для `molecule` с драйвером `molecule_podman`. Проверьте его на исполнимость.
```
molecule init scenario tox -d podman
```
molecule.yml
```
---
dependency:
  name: galaxy
driver:
  name: podman
platforms:
  - name: stupefied_curie
    image: docker.io/pycontribs/debian:latest
    pre_build_image: true
provisioner:
  name: ansible
verifier:
  name: ansible
scenario:
  test_sequence:
    - destroy
    - create
    - converge
    - destroy
```

6. Пропишите правильную команду в `tox.ini`, чтобы запускался облегчённый сценарий.
```
[tox]
minversion = 1.8
basepython = python3.6
envlist = py{37}-ansible{210,30}
skipsdist = true

[testenv]
passenv = *
deps =
    -r tox-requirements.txt
    ansible210: ansible<3.0
    ansible30: ansible<3.1
commands =
    {posargs:molecule test -s tox --destroy always}
```
8. Запустите команду `tox`. Убедитесь, что всё отработало успешно.
<details>
<summary>tox</summary> 

```bash
[root@5db2ac5f6b60 vector-role]# tox
py37-ansible210 installed: ansible==2.10.7,ansible-base==2.10.17,ansible-compat==1.0.0,arrow==1.2.3,bcrypt==4.2.1,binaryornot==0.4.4,cached-property==1.5.2,Cerberus==1.3.7,certifi==2025.7.14,cffi==1.15.1,chardet==5.2.0,charset-normalizer==3.4.2,click==8.1.8,click-help-colors==0.9.4,cookiecutter==2.6.0,cryptography==45.0.5,distro==1.9.0,enrich==1.2.7,idna==3.10,importlib-metadata==6.7.0,Jinja2==3.1.6,jmespath==1.0.1,lxml==5.4.0,markdown-it-py==2.2.0,MarkupSafe==2.1.5,mdurl==0.1.2,molecule==3.6.1,molecule-podman==1.1.0,packaging==24.0,paramiko==2.12.0,pluggy==1.2.0,pycparser==2.21,Pygments==2.17.2,PyNaCl==1.5.0,python-dateutil==2.9.0.post0,python-slugify==8.0.4,PyYAML==6.0.1,requests==2.31.0,rich==13.8.1,selinux==0.2.1,six==1.17.0,subprocess-tee==0.3.5,text-unidecode==1.3,typing_extensions==4.7.1,urllib3==2.0.7,zipp==3.15.0
py37-ansible210 run-test-pre: PYTHONHASHSEED='2197738013'
py37-ansible210 run-test: commands[0] | molecule test -s tox --destroy always
/opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.7 is no longer supported by the Python core team and support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.7.
  from cryptography.exceptions import InvalidSignature
INFO     tox scenario test matrix: destroy, create, converge, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/b984a4/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/b984a4/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/b984a4/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Using /root/.ansible/roles/my_galaxy_namespace.vector symlink to current repository in order to enable Ansible to find the role using its expected full name.
INFO     Running tox > destroy
INFO     Sanity checks: 'podman'
/opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.7 is no longer supported by the Python core team and support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.7.
  from cryptography.exceptions import InvalidSignature

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
/opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.7 is no longer supported by the Python core team and support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.7.
  from cryptography.exceptions import InvalidSignature
/opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/paramiko/pkey.py:82: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from cryptography.hazmat.primitives.ciphers.algorithms in 48.0.0.
  "cipher": algorithms.TripleDES,
/opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/paramiko/transport.py:253: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from cryptography.hazmat.primitives.ciphers.algorithms in 48.0.0.
  "class": algorithms.TripleDES,
changed: [localhost] => (item={'image': 'docker.io/pycontribs/debian:latest', 'name': 'stupefied_curie', 'pre_build_image': True})

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: Wait for instance(s) deletion to complete (300 retries left).
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '597936572106.67', 'results_file': '/root/.ansible_async/597936572106.67', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/debian:latest', 'name': 'stupefied_curie', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running tox > create

PLAY [Create] ******************************************************************

TASK [get podman executable path] **********************************************
/opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.7 is no longer supported by the Python core team and support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.7.
  from cryptography.exceptions import InvalidSignature
/opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/paramiko/pkey.py:82: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from cryptography.hazmat.primitives.ciphers.algorithms in 48.0.0.
  "cipher": algorithms.TripleDES,
/opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/paramiko/transport.py:253: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from cryptography.hazmat.primitives.ciphers.algorithms in 48.0.0.
  "class": algorithms.TripleDES,
ok: [localhost]

TASK [save path to executable as fact] *****************************************
ok: [localhost]

TASK [Log into a container registry] *******************************************
skipping: [localhost] => (item="stupefied_curie registry username: None specified") 

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item=Dockerfile: None specified)

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item="Dockerfile: None specified; Image: docker.io/pycontribs/debian:latest") 

TASK [Discover local Podman images] ********************************************
ok: [localhost] => (item=stupefied_curie)

TASK [Build an Ansible compatible image] ***************************************
skipping: [localhost] => (item=docker.io/pycontribs/debian:latest) 

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item="stupefied_curie command: None specified")

TASK [Remove possible pre-existing containers] *********************************
changed: [localhost]

TASK [Discover local podman networks] ******************************************
skipping: [localhost] => (item=stupefied_curie: None specified) 

TASK [Create podman network dedicated to this scenario] ************************
skipping: [localhost]

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=stupefied_curie)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: Wait for instance(s) creation to complete (300 retries left).
FAILED - RETRYING: Wait for instance(s) creation to complete (299 retries left).
FAILED - RETRYING: Wait for instance(s) creation to complete (298 retries left).
FAILED - RETRYING: Wait for instance(s) creation to complete (297 retries left).
FAILED - RETRYING: Wait for instance(s) creation to complete (296 retries left).
FAILED - RETRYING: Wait for instance(s) creation to complete (295 retries left).
FAILED - RETRYING: Wait for instance(s) creation to complete (294 retries left).
changed: [localhost] => (item=stupefied_curie)

PLAY RECAP *********************************************************************
localhost                  : ok=8    changed=3    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0

INFO     Running tox > converge

PLAY [Converge] ****************************************************************

TASK [Replace this task with one that validates your content] ******************
/opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.7 is no longer supported by the Python core team and support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.7.
  from cryptography.exceptions import InvalidSignature
/opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/paramiko/pkey.py:82: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from cryptography.hazmat.primitives.ciphers.algorithms in 48.0.0.
  "cipher": algorithms.TripleDES,
/opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/paramiko/transport.py:253: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from cryptography.hazmat.primitives.ciphers.algorithms in 48.0.0.
  "class": algorithms.TripleDES,
ok: [stupefied_curie] => {
    "msg": "This is the effective test"
}

PLAY RECAP *********************************************************************
stupefied_curie            : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running tox > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
/opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.7 is no longer supported by the Python core team and support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.7.
  from cryptography.exceptions import InvalidSignature
/opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/paramiko/pkey.py:82: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from cryptography.hazmat.primitives.ciphers.algorithms in 48.0.0.
  "cipher": algorithms.TripleDES,
/opt/vector-role/.tox/py37-ansible210/lib/python3.7/site-packages/paramiko/transport.py:253: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from cryptography.hazmat.primitives.ciphers.algorithms in 48.0.0.
  "class": algorithms.TripleDES,
changed: [localhost] => (item={'image': 'docker.io/pycontribs/debian:latest', 'name': 'stupefied_curie', 'pre_build_image': True})

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: Wait for instance(s) deletion to complete (300 retries left).
FAILED - RETRYING: Wait for instance(s) deletion to complete (299 retries left).
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '121544803530.550', 'results_file': '/root/.ansible_async/121544803530.550', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/debian:latest', 'name': 'stupefied_curie', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
py37-ansible30 installed: ansible==3.0.0,ansible-base==2.10.17,ansible-compat==1.0.0,arrow==1.2.3,bcrypt==4.2.1,binaryornot==0.4.4,cached-property==1.5.2,Cerberus==1.3.7,certifi==2025.7.14,cffi==1.15.1,chardet==5.2.0,charset-normalizer==3.4.2,click==8.1.8,click-help-colors==0.9.4,cookiecutter==2.6.0,cryptography==45.0.5,distro==1.9.0,enrich==1.2.7,idna==3.10,importlib-metadata==6.7.0,Jinja2==3.1.6,jmespath==1.0.1,lxml==5.4.0,markdown-it-py==2.2.0,MarkupSafe==2.1.5,mdurl==0.1.2,molecule==3.6.1,molecule-podman==1.1.0,packaging==24.0,paramiko==2.12.0,pluggy==1.2.0,pycparser==2.21,Pygments==2.17.2,PyNaCl==1.5.0,python-dateutil==2.9.0.post0,python-slugify==8.0.4,PyYAML==6.0.1,requests==2.31.0,rich==13.8.1,selinux==0.2.1,six==1.17.0,subprocess-tee==0.3.5,text-unidecode==1.3,typing_extensions==4.7.1,urllib3==2.0.7,zipp==3.15.0
py37-ansible30 run-test-pre: PYTHONHASHSEED='2197738013'
py37-ansible30 run-test: commands[0] | molecule test -s tox --destroy always
/opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.7 is no longer supported by the Python core team and support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.7.
  from cryptography.exceptions import InvalidSignature
INFO     tox scenario test matrix: destroy, create, converge, destroy
INFO     Performing prerun...
INFO     Set ANSIBLE_LIBRARY=/root/.cache/ansible-compat/b984a4/modules:/root/.ansible/plugins/modules:/usr/share/ansible/plugins/modules
INFO     Set ANSIBLE_COLLECTIONS_PATH=/root/.cache/ansible-compat/b984a4/collections:/root/.ansible/collections:/usr/share/ansible/collections
INFO     Set ANSIBLE_ROLES_PATH=/root/.cache/ansible-compat/b984a4/roles:/root/.ansible/roles:/usr/share/ansible/roles:/etc/ansible/roles
INFO     Using /root/.ansible/roles/my_galaxy_namespace.vector symlink to current repository in order to enable Ansible to find the role using its expected full name.
INFO     Running tox > destroy
INFO     Sanity checks: 'podman'
/opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.7 is no longer supported by the Python core team and support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.7.
  from cryptography.exceptions import InvalidSignature

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
/opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.7 is no longer supported by the Python core team and support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.7.
  from cryptography.exceptions import InvalidSignature
/opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/paramiko/pkey.py:82: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from cryptography.hazmat.primitives.ciphers.algorithms in 48.0.0.
  "cipher": algorithms.TripleDES,
/opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/paramiko/transport.py:253: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from cryptography.hazmat.primitives.ciphers.algorithms in 48.0.0.
  "class": algorithms.TripleDES,
changed: [localhost] => (item={'image': 'docker.io/pycontribs/debian:latest', 'name': 'stupefied_curie', 'pre_build_image': True})

TASK [Wait for instance(s) deletion to complete] *******************************
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '2132067014.728', 'results_file': '/root/.ansible_async/2132067014.728', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/debian:latest', 'name': 'stupefied_curie', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running tox > create

PLAY [Create] ******************************************************************

TASK [get podman executable path] **********************************************
/opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.7 is no longer supported by the Python core team and support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.7.
  from cryptography.exceptions import InvalidSignature
/opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/paramiko/pkey.py:82: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from cryptography.hazmat.primitives.ciphers.algorithms in 48.0.0.
  "cipher": algorithms.TripleDES,
/opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/paramiko/transport.py:253: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from cryptography.hazmat.primitives.ciphers.algorithms in 48.0.0.
  "class": algorithms.TripleDES,
ok: [localhost]

TASK [save path to executable as fact] *****************************************
ok: [localhost]

TASK [Log into a container registry] *******************************************
skipping: [localhost] => (item="stupefied_curie registry username: None specified") 

TASK [Check presence of custom Dockerfiles] ************************************
ok: [localhost] => (item=Dockerfile: None specified)

TASK [Create Dockerfiles from image names] *************************************
skipping: [localhost] => (item="Dockerfile: None specified; Image: docker.io/pycontribs/debian:latest") 

TASK [Discover local Podman images] ********************************************
ok: [localhost] => (item=stupefied_curie)

TASK [Build an Ansible compatible image] ***************************************
skipping: [localhost] => (item=docker.io/pycontribs/debian:latest) 

TASK [Determine the CMD directives] ********************************************
ok: [localhost] => (item="stupefied_curie command: None specified")

TASK [Remove possible pre-existing containers] *********************************
changed: [localhost]

TASK [Discover local podman networks] ******************************************
skipping: [localhost] => (item=stupefied_curie: None specified) 

TASK [Create podman network dedicated to this scenario] ************************
skipping: [localhost]

TASK [Create molecule instance(s)] *********************************************
changed: [localhost] => (item=stupefied_curie)

TASK [Wait for instance(s) creation to complete] *******************************
FAILED - RETRYING: Wait for instance(s) creation to complete (300 retries left).
changed: [localhost] => (item=stupefied_curie)

PLAY RECAP *********************************************************************
localhost                  : ok=8    changed=3    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0

INFO     Running tox > converge

PLAY [Converge] ****************************************************************

TASK [Replace this task with one that validates your content] ******************
/opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.7 is no longer supported by the Python core team and support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.7.
  from cryptography.exceptions import InvalidSignature
/opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/paramiko/pkey.py:82: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from cryptography.hazmat.primitives.ciphers.algorithms in 48.0.0.
  "cipher": algorithms.TripleDES,
/opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/paramiko/transport.py:253: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from cryptography.hazmat.primitives.ciphers.algorithms in 48.0.0.
  "class": algorithms.TripleDES,
ok: [stupefied_curie] => {
    "msg": "This is the effective test"
}

PLAY RECAP *********************************************************************
stupefied_curie            : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Running tox > destroy

PLAY [Destroy] *****************************************************************

TASK [Destroy molecule instance(s)] ********************************************
/opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/ansible/parsing/vault/__init__.py:44: CryptographyDeprecationWarning: Python 3.7 is no longer supported by the Python core team and support for it is deprecated in cryptography. The next release of cryptography will remove support for Python 3.7.
  from cryptography.exceptions import InvalidSignature
/opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/paramiko/pkey.py:82: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from cryptography.hazmat.primitives.ciphers.algorithms in 48.0.0.
  "cipher": algorithms.TripleDES,
/opt/vector-role/.tox/py37-ansible30/lib/python3.7/site-packages/paramiko/transport.py:253: CryptographyDeprecationWarning: TripleDES has been moved to cryptography.hazmat.decrepit.ciphers.algorithms.TripleDES and will be removed from cryptography.hazmat.primitives.ciphers.algorithms in 48.0.0.
  "class": algorithms.TripleDES,
changed: [localhost] => (item={'image': 'docker.io/pycontribs/debian:latest', 'name': 'stupefied_curie', 'pre_build_image': True})

TASK [Wait for instance(s) deletion to complete] *******************************
FAILED - RETRYING: Wait for instance(s) deletion to complete (300 retries left).
FAILED - RETRYING: Wait for instance(s) deletion to complete (299 retries left).
changed: [localhost] => (item={'started': 1, 'finished': 0, 'ansible_job_id': '636169949687.1027', 'results_file': '/root/.ansible_async/636169949687.1027', 'changed': True, 'failed': False, 'item': {'image': 'docker.io/pycontribs/debian:latest', 'name': 'stupefied_curie', 'pre_build_image': True}, 'ansible_loop_var': 'item'})

PLAY RECAP *********************************************************************
localhost                  : ok=2    changed=2    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

INFO     Pruning extra files from scenario ephemeral directory
________________________________________________________________________________________________________________________________ summary ________________________________________________________________________________________________________________________________
  py37-ansible210: commands succeeded
  py37-ansible30: commands succeeded
  congratulations :)
```
</details>

9. Добавьте новый тег на коммит с рабочим сценарием в соответствии с семантическим версионированием.

После выполнения у вас должно получится два сценария molecule и один tox.ini файл в репозитории. Не забудьте указать в ответе теги решений Tox и Molecule заданий. В качестве решения пришлите ссылку на  ваш репозиторий и скриншоты этапов выполнения задания. 

## Необязательная часть

1. Проделайте схожие манипуляции для создания роли LightHouse.
2. Создайте сценарий внутри любой из своих ролей, который умеет поднимать весь стек при помощи всех ролей.
3. Убедитесь в работоспособности своего стека. Создайте отдельный verify.yml, который будет проверять работоспособность интеграции всех инструментов между ними.
4. Выложите свои roles в репозитории.

В качестве решения пришлите ссылки и скриншоты этапов выполнения задания.

---

### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.
