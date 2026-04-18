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

Create a `mise.local.toml` file containing your Scaleway access key, secret
key, organization ID and project ID:

```toml
[env]
SCW_ACCESS_KEY = "..."
SCW_SECRET_KEY = "..."
SCW_DEFAULT_ORGANIZATION_ID = "..."
SCW_DEFAULT_PROJECT_ID = "..."
```

Then initialize the project:

```shell
$ mise run init
```

## Plan and apply

Run the following to plan and apply any changes to the infrastructure.

```shell
$ mise run plan
$ mise run apply
```
