# Docker Image Packaging for openSUSE

## 15.1-XalvistackY - TBC

### Major Changes

  - Revamp `create`, `side_effect`, `verify` and `destroy` logic
  - Replace `tini` with `catatonit`
  - Rename `post_tasks.yml` as `side_effect.yml`

## 15.1-4alvistack4 - 2020-03-05

### Major Changes

  - Revamp with Molecule and `docker commit`
  - Consolidate molecule tests into `default` (noop)
  - Hotfix for systemd
  - Replace `duplicity` with `restic`

## 15.1-3alvistack1 - 2020-01-15

### Major Changes

  - Replace `dumb-init` with `tini`, as like as `docker --init`
  - Replace `java` with `openjdk`
  - Replace `nodejs` with `node`
  - Include release specific vars and tasks

## 15.1-2alvistack3 - 2019-11-05

### Major Changes

  - Upgrade minimal Ansible support to 2.9.0
  - Upgrade Travis CI test as Ubuntu Bionic based
  - Default with Python 3
  - Hotfix for CVE-2019-5021
  - Prepend executable if command starts with an option
  - Improve `ENTRYPOINT` and `CMD`
  - Add openSUSE 15.1 support
  - Remove openSUSE 15.0 support

## 15.0-0alvistack7 - 2019-05-20

### Major Changes

  - Bugfix "Build times out because no output was received"
  - Upgrade minimal Ansible support to 2.8.0

## 15.0-0alvistack5 - 2019-04-15

### Major Changes

  - Remove openSUSE 42.3 support
  - Porting to Molecule based
  - Add rclone support

## 15.0-0alvistack1 - 2019-02-17

  - openSUSE Leap 15.0/42.3 based
  - Handle ENTRYPOINT with dumb-init
  - Handle `CMD` with SSHD
  - Self initialize with Ansible, by dogfooding with Ansible Playbook
