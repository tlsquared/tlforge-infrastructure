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

1. Create a `mise.local.toml` file containing your Scaleway access key and
   secret key:

   ```toml
   [env]
   SCW_ACCESS_KEY = "..."
   SCW_SECRET_KEY = "..."
   ```

2. Create a `terraform.tfvars` file containing your variable values:

   ```terraform
   scaleway_organization_id = "..."
   scaleway_project_id = "..."
   ```

## Plan and apply

```shell
$ mise run init
$ mise run plan
$ mise run apply
```
