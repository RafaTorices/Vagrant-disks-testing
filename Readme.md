# Vagrant VM for testing Disks in VirtualBox
## Author: Rafael Torices

This is a Vagrant VM for testing Disks. It has 2 disks attached to it. The first one is the main disk and the second one is a secondary disk that can be used for testing purposes.

## Requirements

- [Vagrant](https://www.vagrantup.com/)
- [VirtualBox](https://www.virtualbox.org/)
  
## Usage

To start the VM, run the following command:

```bash
vagrant up
```

To stop the VM, run the following command:

```bash
vagrant halt
```

To destroy the VM, run the following command:

```bash
vagrant destroy
```

>NOTE: password for the user `vagrant` is `vagrant`