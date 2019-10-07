# Docker Image Packaging for openSUSE

## 15.1-1alvistackx - TBC

### Major Changes

  - Default with Python 3

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
