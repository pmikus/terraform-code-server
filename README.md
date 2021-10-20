<!-- markdownlint-disable MD041 -->
<p align="center">[![Docker CI](https://github.com/pmikus/terraform-code-server/actions/workflows/CI.yml/badge.svg)](https://github.com/pmikus/terraform-code-server/actions/workflows/CI.yml)</p>

## Content
1. [Terraform-docker-code-server](#terraform-docker-code-server)
2. [Compatibility](#compatibility)
3. [Requirements](#requirements)
    1. [Required modules](#required-modules)
    2. [Required software](#required-software)
4. [Usage](#usage)
    1. [Verifying setup](#verifying-setup)
    2. [Intentions](#intentions)
    3. [Providers](#providers)
5. [Example usage](#example-usage)
6. [Inputs](#inputs)
7. [Outputs](#outputs)
8. [Secrets & Credentials](#secrets--credentials)
    1. [Set credentials manually](#set-credentials-manually)
    2. [Set credentials using Vault secrets](#set-credentials-using-vault-secrets)
    3. [Key Management Secrets (KMS)](#key-management-secrets-kms)
9. [Volumes](#volumes)
10. [Contributors](#contributors)
11. [Licence](#license)


# Terraform-docker-code-server

Terraform-docker-code-server module is IaC - infrastructure as code. Module
contains a docker job with [Code-server](https://coder.com).

## Compatibility

| Software | OSS Version | Enterprise Version |
| :------- | :---------- | :-------- |
| Terraform | 1.0.3 or newer|  |
| Docker | 2.15.0 or newer |  |

## Requirements

### Required modules

No modules required.

### Required software

- [Docker](https://docs.docker.com/engine/)
- [Consul](https://releases.hashicorp.com/consul/) binary available on `PATH` on
  the local machine.

## Usage

The following command will run a standalone instance of Code-server.
```text
terraform init
terraform apply
```

### Verifying setup

You can now visit the UI on [localhost:8080/](http://localhost:8080/).

## Volumes

Using
[host volume](https://www.nomadproject.io/docs/job-specification/volume) to
store Code-server data.

## License

This work licensed under Apache 2 License. See [LICENSE](./LICENSE) for full
details.
