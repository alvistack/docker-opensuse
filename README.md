# Docker Image Packaging for openSUSE

[![Travis](https://img.shields.io/travis/alvistack/docker-opensuse.svg)](https://travis-ci.org/alvistack/docker-opensuse)
[![GitHub release](https://img.shields.io/github/release/alvistack/docker-opensuse.svg)](https://github.com/alvistack/docker-opensuse/releases)
[![GitHub license](https://img.shields.io/github/license/alvistack/docker-opensuse.svg)](https://github.com/alvistack/docker-opensuse/blob/master/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/alvistack/opensuse.svg)](https://hub.docker.com/r/alvistack/opensuse/)

openSUSE is a free and open-source operating system and Linux distribution based on Debian.

Learn more about openSUSE: <https://www.opensuse.org/>

## Supported Tags and Respective `Dockerfile` Links

  - [`15.1`, `latest`](https://github.com/alvistack/docker-opensuse/blob/master/molecule/15.1/Dockerfile.j2)

## Overview

This Docker container makes it easy to get an instance of SSHD up and running with openSUSE.

Based on [Official openSUSE Leap Docker Image](https://hub.docker.com/r/opensuse/leap/) with some minor hack:

  - Minimized `Dockerfile` for meta data definition
  - Provision by Ansible and Molecule Docker driver in single layer
  - Handle `ENTRYPOINT` with [tini](https://github.com/krallin/tini)
  - Handle `CMD` with SSHD

### Quick Start

Start SSHD:

    # Pull latest image
    docker pull alvistack/opensuse
    
    # Run as detach
    docker run \
        -itd \
        --name opensuse \
        --publish 2222:22 \
        alvistack/opensuse

**Success**. SSHD is now available on port `2222`.

Because this container **DIDN'T** handle the generation of root password, so you should set it up manually with `pwgen` by:

    # Generate password with pwgen
    PASSWORD=$(docker exec -i opensuse pwgen -cnyB1); echo $PASSWORD
    
    # Inject the generated password
    echo "root:$PASSWORD" | docker exec -i opensuse chpasswd

Alternatively, you could inject your own SSH public key into container's authorized\_keys by:

    # Inject your own SSH public key
    (docker exec -i opensuse sh -c "cat >> /root/.ssh/authorized_keys") < ~/.ssh/id_rsa.pub

Now you could SSH to it as normal:

    ssh root@localhost -p 2222

## Versioning

### `alvistack/opensuse:latest`

The `latest` tag matches the most recent [GitHub Release](https://github.com/alvistack/docker-opensuse/releases) of this repository. Thus using `alvistack/opensuse:latest` or `alvistack/opensuse` will ensure you are running the most up to date stable version of this image.

### `alvistack/opensuse:<version>`

The version tags are rolling release rebuild by [Travis](https://travis-ci.org/alvistack/docker-opensuse) in weekly basis. Thus using these tags will ensure you are running the latest packages provided by the base image project.

## License

  - Code released under [Apache License 2.0](LICENSE)
  - Docs released under [CC BY 4.0](http://creativecommons.org/licenses/by/4.0/)

## Author Information

  - Wong Hoi Sing Edison
      - <https://twitter.com/hswong3i>
      - <https://github.com/hswong3i>
