# TL Forge — Infrastructure

This repository contains infrastructure as code configuration for
[TL Forge][tlforge] running on [Scaleway][scaleway] using [Forgejo][forgejo].

[tlforge]: https://tlforge.dev/
[scaleway]: https://www.scaleway.com/
[forgejo]: https://forgejo.org/

## Dependencies

```shell
$ brew install mise
$ mise install
```

## Setup

1. Create a `mise.local.toml` file containing your Scaleway access key, secret
   key, organization ID and project ID:

   ```toml
   [env]
   SCW_ACCESS_KEY = "..."
   SCW_SECRET_KEY = "..."
   SCW_DEFAULT_ORGANIZATION_ID = "..."
   SCW_DEFAULT_PROJECT_ID = "..."
   ```

2. Create a `terraform.tfvars` file containing the runners:

   ```terraform
   runners = [
     {
       uuid = "...",
       token = "..."
     }
   ]
   ```

3. Initialize the project:

   ```shell
   $ mise run init
   ```

## Plan and apply

Run the following to plan and apply any changes to the infrastructure.

```shell
$ mise run plan
$ mise run apply
```

## Maintenance

### Running Ansible

#### On the main instance

```shell
$ ansible-pull -U https://tlforge.dev/tlsquared/tlforge-ansible.git
```

#### On a runner instance

```shell
$ ansible-pull -U https://tlforge.dev/tlsquared/tlforge-ansible.git tlforge-runner.yml
```
