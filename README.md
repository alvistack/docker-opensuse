# Docker Image Packaging for openSUSE

<a href="https://alvistack.com" title="AlviStack" target="_blank"><img src="/alvistack.svg" height="75" alt="AlviStack"></a>

[![GitLab pipeline
status](https://img.shields.io/gitlab/pipeline/alvistack/docker-opensuse/master)](https://gitlab.com/alvistack/docker-opensuse/-/pipelines)
[![GitHub
tag](https://img.shields.io/github/tag/alvistack/docker-opensuse.svg)](https://github.com/alvistack/docker-opensuse/tags)
[![GitHub
license](https://img.shields.io/github/license/alvistack/docker-opensuse.svg)](https://github.com/alvistack/docker-opensuse/blob/master/LICENSE)
[![Docker
Pulls](https://img.shields.io/docker/pulls/alvistack/opensuse-leap-15.6.svg)](https://hub.docker.com/r/alvistack/opensuse-leap-15.6)

openSUSE, formerly SUSE Linux, is a Linux distribution sponsored by SUSE
Software Solutions Germany GmbH (formerly SUSE Linux GmbH) and other
companies. Its "Leap" variant shares a common code base with, and is a
direct upgradable installation for the commercially-produced SUSE Linux
Enterprise, effectively making openSUSE Leap a non-commercial version of
the enterprise product. It is widely used throughout the world. The
focus of its development is creating usable open-source tools for
software developers and system administrators, while providing a
user-friendly desktop and feature-rich server environment.

Learn more about openSUSE: <https://www.opensuse.org/>

## Supported Tags and Respective Packer Template Links

- [`alvistack/opensuse-tumbleweed`](https://hub.docker.com/r/alvistack/opensuse-tumbleweed)
  - [`packer/docker-tumbleweed/packer.json`](https://github.com/alvistack/docker-opensuse/blob/master/packer/docker-tumbleweed/packer.json)
- [`alvistack/opensuse-leap-15.6`](https://hub.docker.com/r/alvistack/opensuse-leap-15.6)
  - [`packer/docker-leap-15.6/packer.json`](https://github.com/alvistack/docker-opensuse/blob/master/packer/docker-leap-15.6/packer.json)

## Overview

This Docker container makes it easy to get an instance of SSHD up and
running with openSUSE.

Based on [Official openSUSE Leap Docker
Image](https://hub.docker.com/r/opensuse/leap/) with some minor hack:

- Packaging by Packer Docker builder and Ansible provisioner in single
  layer
- Handle `ENTRYPOINT` with
  [catatonit](https://github.com/openSUSE/catatonit)
- Handle `CMD` with SSHD

### Quick Start

Start SSHD:

    # Pull latest image
    docker pull alvistack/opensuse-leap-15.6

    # Run as detach
    docker run \
        -itd \
        --name opensuse \
        --publish 2222:22 \
        alvistack/opensuse-leap-15.6

**Success**. SSHD is now available on port `2222`.

Because this container **DIDN'T** handle the generation of root
password, so you should set it up manually with `pwgen` by:

    # Generate password with pwgen
    PASSWORD=$(docker exec -i opensuse pwgen -cnyB1); echo $PASSWORD

    # Inject the generated password
    echo "root:$PASSWORD" | docker exec -i opensuse chpasswd

Alternatively, you could inject your own SSH public key into container's
authorized_keys by:

    # Inject your own SSH public key
    (docker exec -i opensuse sh -c "cat >> /root/.ssh/authorized_keys") < ~/.ssh/id_rsa.pub

Now you could SSH to it as normal:

    ssh root@localhost -p 2222

## Versioning

### `YYYYMMDD.Y.Z`

Release tags could be find from [GitHub
Release](https://github.com/alvistack/docker-opensuse/tags) of this
repository. Thus using these tags will ensure you are running the most
up to date stable version of this image.

### `YYYYMMDD.0.0`

Version tags ended with `.0.0` are rolling release rebuild by [GitLab
pipeline](https://gitlab.com/alvistack/docker-opensuse/-/pipelines) in
weekly basis. Thus using these tags will ensure you are running the
latest packages provided by the base image project.

## License

- Code released under [Apache License 2.0](LICENSE)
- Docs released under [CC BY
  4.0](http://creativecommons.org/licenses/by/4.0/)

## Author Information

- Wong Hoi Sing Edison
  - <https://twitter.com/hswong3i>
  - <https://github.com/hswong3i>
