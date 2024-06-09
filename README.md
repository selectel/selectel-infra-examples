# Selectel Terraform Modules Example

[![Terraform - Selectel Terraform modules](https://github.com/selectel/selectel-infra-examples/actions/workflows/modules.yml/badge.svg)](https://github.com/selectel/selectel-infra-examples/actions/workflows/modules.yml) [![version](https://img.shields.io/badge/terraform-1.6.2-green.svg)](https://semver.org)

[![OpenTofu - Selectel Terraform modules](https://github.com/selectel/selectel-infra-examples/actions/workflows/opentofu.yml/badge.svg)](https://github.com/selectel/selectel-infra-examples/actions/workflows/opentofu.yml) [![version](https://img.shields.io/badge/opentofu-1.6.2-yellow.svg)](https://semver.org)

- [Selectel Terraform Modules Example](#selectel-terraform-modules-example)
  - [Использование](#использование)
    - [1. State File](#1-state-file)
    - [2. Init](#2-init)
  - [Пример использования](#пример-использования)
  - [Структура репозитория](#структура-репозитория)
    - [Modules](#modules)

В [данном репозитории](https://github.com/selectel/selectel-infra-examples) находятся примеры Terraform модулей, используемых для создания инфраструктуры в облаке Selectel. С учетом нынешних реалий в репозитории Вы можете найти ежедневные пайплайны проверки создания ресурсов через **Terraform** и **OpenTofu**.

**P.S. **Если Вы не нашли пример для создания определенного ресурса - Вы можете оставить issue и мы примем во внимание необходимость его добавления.

Перед началом работы с облачными ресурсами Selectel через Terraform/OpenTofu рекомендуем ознакомиться с [документацией по провайдеру Selectel/OpenStack](https://docs.selectel.ru/terraform/).

> **ВАЖНО!**
> С версии репозитория >= 2.0.1 было добавлено тестирование запуска terraform кода через [OpenTofu](https://opentofu.org/). В связи с блокировкой terraform registry из РФ. Необходимость в terraform-proxy или terraform-mirror усложняет использование terraform. OpenTofu позволяет без проксей, зеркал и изменений в коде использовать все теже провайдеры, что лежат в registry.terraform.io. Все провайдеры OpenTofu лежат в репозитории - [ссылка](https://github.com/opentofu/registry/tree/main/providers). Так же документация по провайдерам от OpenTofu - [ссылка](https://opentofu.org/docs/language/providers/).

## Использование

> Далее все команды terraform-cli могут быть заменены на tofu. Будут работать оба варианта.
> 
> Перед использованием **проверьте версию Terraform/OpenTofu**, данный репозиторий гарантирует запуск Terraform кода только на определенной версии Terraform/OpenTofu - [смотри в шапке README](#selectel-terraform-modules-example).

### 1. State File

Cтейт-файл в репозитории указан `s3`.
**Для локального запуска** потребуется изменить на `local` в файле [versions.tf](https://github.com/selectel/selectel-infra-examples/blob/main/versions.tf#L12):

```tf
terraform {
  backend "local" {}
}
```

<details>
<summary>Пример передачи `backend` для хранения стейта в S3 через CLI:</summary>

```tf
terraform init
  -backend-config="bucket=< имя бакета s3 >"
  -backend-config="endpoint=s3.ru-1.storage.selcloud.ru"
  -backend-config="key=< имя стейт-файла >.tfstate"
  -backend-config="region=ru-1"
  -backend-config="skip_region_validation=true"
  -backend-config="skip_credentials_validation=true"
  -backend-config="access_key=< S3_ACCESS_KEY >"
  -backend-config="secret_key=< secrets.S3_SECRET_KEY >"
```
</details>

<details>
<summary>Через tf файл:</summary>

```tf
terraform {
  backend "s3" {
    bucket     = "< имя бакета s3 >"
    endpoint   = "s3.ru-1.storage.selcloud.ru"
    key        = "< имя стейт-файла >.tfstate"
    region     = "ru-1"
    access_key = "< S3_ACCESS_KEY >"
    secret_key = "< secrets.S3_SECRET_KEY >"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
```
</details>

### 2. Init

Вы можете использовать все модули, которые есть в репозитории или закомментировать лишние, но учтите, что **в первую очередь создается проект с сервисным пользователем**, которые необходимы для провайдера `Openstack`. 

>Все, что будет создано ресурсами из провайдера `Openstack` должно идти после создания проекта и пользователя! Для этого потребуется добавить `depends_on` к ресурсу:
> ```tf
> depends_on = [ module.project-with-user ]
> ```

**Опционально:** Создаем файл `main.tf`, где описана необходимая инфраструктура (пример ниже - создание `Simple File Storage`, остальные примеры смотри в папке [modules](https://github.com/selectel/selectel-infra-examples/tree/main/modules)):

```yaml
module "sfs" {
  source               = "modules/sfs"
  os_network_id        = var.nat_network_id
  os_subnet_id         = var.nat_subnet_id
  sfs_size             = var.sfs_size
  sfs_volume_type      = var.sfs_volume_type
  os_availability_zone = var.os_availability_zone
}
```

1. Инициализируем Terraform Backend командой:

> обрати внимание на настройку стейт-файла [выше](#1-state-file)

```bash
terraform init
```

2. Для проверки вносимых изменений выполняем команду:

```bash
terraform plan
```

3. Для применения изменений выполняем команду:

```bash
terraform apply
```

> `terraform apply -auto-approve` - для применения без подтверждения

## Пример использования

В репозитории можно найти пример использования модулей. В корне репозитория созданы `*.tf` файлы, которые можно использовать как пример вызова модулей.

Для их использования достаточно перейти в корень репозитория и инициализировать Terraform:

```bash
terraform init
```

Далее можно скорректировать некоторые параметры в файле `main.tf`, которые передаются в модули, например, объём SFS, имя кластера и другие.

Затем необходимо задать переменные, в которых будут содержаться данные от аккаунта Selectel, в котором будет развёрнута инфраструктура:

- `selectel_domain_name`, ID аккаунта, например, 123123
- `selectel_user_admin_user`, сервисный пользователь с нужными правами 
- `selectel_user_admin_password`, пароль от сервисного пользователя

Переменные можно задать несколькими способами:

- В качестве переменных окружения (для этого нужно добавить перед названием переменной `TF_VAR_`):

```bash
export TF_VAR_selectel_domain_name=123123
export TF_VAR_selectel_user_admin_user=foo
export TF_VAR_selectel_user_admin_password=bar
terraform plan/apply
```
- Ввести вместе с командой `terraform plan/apply` с помощью параметра `-var`:

```bash
terraform plan/apply \
-var="selectel_domain_name=123123" \
-var="selectel_user_admin_user=foo" \
-var="selectel_user_admin_password=bar"
```

- Ввести с клавиатуры, если переменные не были заданы любым другим способом

После успешного выполнения команды `terraform apply` вы должны увидеть в своём аккаунте новый проект, в котором будут запущены все модули (MKS, SFS, vm, CRaaS и др.)

## Структура репозитория

Репозиторий включает в себя минимально необходимую структура для запуска terraform. Самое интересное это папка [moduels](https://github.com/selectel/selectel-infra-examples/tree/main/modules) в которой собраны примеры запуска компонентов в облаке Selectel.

### Modules

  * [craas](modules/craas) - создание [Container as a Service](https://selectel.ru/services/cloud/container-registry/)
  * [flavor](modules/flavor) - создание flavor (тип инстанса)
  * [floatingip](modules/floatingip) - создание плавающего ip адреса
  * [image_datasource](modules/image_datasource) - считывание айдишника образа
  * [keypair](modules/keypair) - создание ключевой пары для подключения по SSH
  * [mks](modules/mks) - набор модулей для создания [Selectel Managed Kubernetes](https://selectel.ru/services/cloud/kubernetes/)
    * [k8s-cluster](modules/mks/k8s-cluster) - создание master ноды k8s
    * [k8s-cluster-standalone](modules/mks/k8s-cluster-standalone) - создание managed kubernetes кластера
    * [k8s-nodegroup](modules/mks/k8s-nodegroup) - создание compute ноды k8s
    * [k8s-nodegroup-gpu](modules/mks/k8s-nodegroup-gpu) - создание compute ноды с GPU k8s
  * [nat](modules/nat) - создание nat сети
  * [network](modules/network) - создание локальной сети
  * [os_project_with_user](modules/os_project_with_user) - создание проекта в облаке Selectel
  * [s3](modules/s3) - создание [объектного хранилища s3](https://selectel.ru/services/cloud/storage/)
    * [s3-bucket](modules/s3-bucket) - создание s3 бакета
    * [s3-credentials](modules/s3-credentioals) - создание s3 параметров авторизации
  * [selectel-token](modules/selectel) - создание токена аккаунта Selectel
  * [sfs](modules/sfs) - создание [файлового хранилища](https://selectel.ru/lab/file-storage/)
  * [vm](modules/vm) - создание [виртуального облачного сервера](https://selectel.ru/services/cloud/servers/)
  * [volume](modules/volume) - создание облачного диска
