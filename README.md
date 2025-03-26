# Selectel Terraform Modules Example

|                   | Pipeline Status                                                                                                                                                                         | Version                                                                                                                       |
|-------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| Terraform Latest | [![](https://github.com/selectel/selectel-infra-examples/actions/workflows/modules.yml/badge.svg)](https://github.com/selectel/selectel-infra-examples/actions/workflows/modules.yml)   | [![version](https://img.shields.io/badge/Terraform-Latest-green.svg)](https://github.com/hashicorp/terraform/releases/latest) |
| OpenTofu Latest   | [![](https://github.com/selectel/selectel-infra-examples/actions/workflows/opentofu.yml/badge.svg)](https://github.com/selectel/selectel-infra-examples/actions/workflows/opentofu.yml) | [![version](https://img.shields.io/badge/OpenTofu-Latest-green.svg)](https://github.com/opentofu/opentofu/releases/latest)    |

- [Selectel Terraform Modules Example](#selectel-terraform-modules-example)
  - [Использование](#использование)
    - [1. .terraformrc/.tofurc](#1-terraformrctofurc)
    - [2. State File](#2-state-file)
    - [3. Init](#3-init)
  - [Пример использования](#пример-использования)
  - [Структура репозитория](#структура-репозитория)
    - [Modules](#modules)

В [данном репозитории](https://github.com/selectel/selectel-infra-examples) находятся примеры Terraform модулей, используемых для создания инфраструктуры в 
облаке Selectel. Также в репозитории еженедельно запускаются пайплайны с тестовым созданием ресурсов с помощью 
**Terraform** и **OpenTofu**.

**P.S.** Если вы не нашли пример для создания определенного ресурса - можете оставить issue и мы примем во 
внимание необходимость его добавления.

Перед началом работы с облачными ресурсами Selectel через Terraform/OpenTofu рекомендуем ознакомиться с 
[документацией по провайдеру Selectel/OpenStack](https://docs.selectel.ru/terraform/).

## Использование

> Все последующие команды terraform-cli могут быть заменены на opentofu.
> 
> Убедитесь, что в вашем env нет лишних переменных вида "OS_*", их наличие повлияет на провайдер Openstack.

### 1. .terraformrc/.tofurc

Для доступа к Terraform Registry из РФ можно воспользоваться кеширующим прокси Selectel, для этого отредактируем 
файл .terraformrc (или .tofurc для OpenTofu):

```bash
cat <<EOS >> $HOME/.terraformrc
provider_installation {
    network_mirror {
      url = "https://tf-proxy.selectel.ru/mirror/v1/"
    }
}
EOS
```

### 2. State File

По умолчанию в репозитории стейт хранится в s3, для локального запуска потребуется изменить поле `backend` на 
`local` в файле [versions.tf](https://github.com/selectel/selectel-infra-examples/blob/main/versions.tf#L12):

```terraform
terraform {
  backend "local" {}
}
```

Пример передачи `backend` для хранения стейта в S3:

```terraform
terraform {
  backend "s3" {
    bucket     = "<название бакета s3>"
    key        = "<название стейт-файла>.tfstate"
    access_key = "<access_key>"
    secret_key = "<secret_key>"
    endpoints  = { s3 = "https://s3.ru-1.storage.selcloud.ru" }
    region     = "ru-1"
    
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    skip_metadata_api_check     = true
  }
}
```

### 3. Init

Для начала работы необходимо создать в Панели Управления проект, в котором будут впоследствии создаваться ресурсы,
а также сервисного пользователя с ролью Администратор проекта для вышеупомянутого проекта. Далее необходимо 
отредактировать `main.tf`, оставив в нём необходимые ресурсы, после чего:


1. Инициализируем Terraform Backend командой:

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

## Пример использования

В репозитории можно найти пример использования модулей. В корне репозитория созданы `*.tf` файлы, которые можно 
использовать как пример вызова модулей.

Для их использования достаточно перейти в корень репозитория и инициализировать Terraform:

```bash
terraform init
```

Далее можно скорректировать некоторые параметры в файле `main.tf`, которые передаются в модули, например, объём 
SFS, имя кластера и другие.

Затем необходимо задать переменные, в которых будут содержаться данные от аккаунта Selectel, в котором будет 
развёрнута инфраструктура:

- `selectel_domain_name` - ID Selectel-аккаунта;
- `selectel_project_name` - название проекта;
- `selectel_project_id` - ID проекта;
- `selectel_user_name` - имя сервисного пользователя; 
- `selectel_user_id` - UID сервисного пользователя;
- `selectel_user_password` - пароль сервисного пользователя.

Переменные можно задать несколькими способами:

- В качестве переменных окружения (для этого нужно добавить перед названием переменной `TF_VAR_`):

```bash
export TF_VAR_selectel_domain_name=123123
export TF_VAR_selectel_project_name=Project
export TF_VAR_selectel_project_id=abcd1234abcd1234abcd1234abcd1234
export TF_VAR_selectel_user_name=foo
export TF_VAR_selectel_user_id=1234abcd1234abcd1234abcd1234abcd
export TF_VAR_selectel_user_password=bar
terraform plan/apply
```
- Ввести вместе с командой `terraform plan/apply` с помощью параметра `-var`:

```bash
terraform plan/apply \
-var="selectel_domain_name=123123" \
-var="selectel_project_name=Project" \
-var="selectel_project_id=abcd1234abcd1234abcd1234abcd1234" \
-var="selectel_user_name=foo" \
-var="selectel_user_id=1234abcd1234abcd1234abcd1234abcd" \
-var="selectel_user_password=bar"
```

- Ввести с клавиатуры, если переменные не были заданы любым другим способом

После успешного выполнения команды `terraform apply` в заданном проекте появятся указанные в `main.tf` ресурсы.

## Структура репозитория

Репозиторий включает в себя минимально необходимую структуру для запуска Terraform. В директории [modules](https://github.com/selectel/selectel-infra-examples/tree/main/modules) 
собраны модули для создания различных компонентов в облаке Selectel.

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
