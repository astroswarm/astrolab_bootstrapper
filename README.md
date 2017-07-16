# Astrolab Builder

Builds Astrolab image on a Vagrant virtual machine running Debian, or on a Raspberry Pi running Raspbian.

## How it works

`bootstrap-pi <pi ip address>` adds your public ssh key to the authorized_keys file on a Raspberry Pi so that the builder can ssh into the box.

`deploy-pi <pi ip address>` builds AstroSwarm on the Raspberry Pi.

`deploy-vagrant` launches a Debian VM (if it's not already running), and builds AstroSwarm on the VM.

## Requirements

* Ansible 2.2.1+ (Needs this fix for avinetworks.docker: https://github.com/ansible/ansible/issues/17490)
* Vagrant
* Virtualbox
* Public/private RSA keypair stored in ~/.ssh

Current tooling assumes a Mac OS X development system.

## Quick Start

### Building on a Debian VM

1. Run `./deploy-vagrant`
1. Look for your Astrolab at `http://app.astroswarm.com/#activate`
