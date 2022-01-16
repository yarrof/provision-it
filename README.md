# Provision It

## Story

You will learn how to automate VM creation and configuration using Vagrant and shell scripts. In the meanwhile, you will learn about `nginx` which is a fast web server and a swiss army knife of [web tasks](https://www.nginx.com/products/).

## What are you going to learn?

- Vagrant basics
- Vagrant provisioning
- Shell scripting

## Tasks

1. Initialize your Vagrant environment and start up the virtual machine
    - The `vagrant status` command's output contains the text `running (virtualbox)`

2. Set up port forwarding from host to guest
    - The `vagrant port` commands output contains the following: `80 (guest) => 8080 (host)`

3. Setup synced folder
    - On the guest machine the `ls /tmp/synced` command's output contains the the `index.html  nginx.conf` text

4. Configure Vagrant to run the provisioning script
    - On the host machine the `vagrant provision` command's output contains the `default: Running provisioner: shell...` text

5. Install `nginx` service via the provisioning script
    - On the guest machine the `systemctl status nginx` command's output contains the `active (running)` text

6. Backup the default `nginx.conf` and use the one provided in the `synced/` directory via the provisioning script
    - On the guest machine the `ls /etc/nginx/nginx.conf*` command's output contains the `/etc/nginx/nginx.conf  /etc/nginx/nginx.conf.bkp` text
    - On the guest machine the `cat /etc/nginx/nginx.conf` command's output contains the `/usr/share/provision-it/` text (the original `nginx.conf` is overwritten with one in `/tmp/synced`

7. Put the `index.html` provided in the `synced` directory via the provisioning script to its proper place
    - Loading [http://localhost:8080](http://localhost:8080)` in the browser loads a web page with `Provision-it Test Page` title

## General requirements

- Tested the final version of the provisioning script by destroying and recreating the Vagrant environment with `vagrant halt; vagrant destroy; vagrant up`
- The files in the `synced/` directory (`index.html` and `nginx.conf`) are not changed

## Hints

- Install Vagrant which is compatible with your Virtualbox version
- Sometimes vagrant can't start because a process holds port 8080 resource. Figure out which process holds it and figure out how to stop the process
- Run `vagrant reload` after changing the `Vagrantfile`
- Run `vagrant provision` or `vagrant up --provision` to rerun provisioning scripts
- If the virtual environment changed too much to rerun the provisioning script use `vagrant halt; vagrant destroy; vagrant up` to test the provisioning script again

## Background materials

- [Install Vagrant and Virtualbox](https://www.vagrantup.com/docs/installation)
- [Vagrant technology overview](https://www.vagrantup.com/intro)
- [Vagrant synced folders](https://www.vagrantup.com/docs/synced-folders)
- [Vagrant port forwarding](https://www.vagrantup.com/docs/networking/forwarded_ports)
- [Getting around Vagrant](https://www.youtube.com/watch?v=I58GDM9KmMI)
- [Nginx beginners guide](http://nginx.org/en/docs/beginners_guide.html)
- [How to find process holding a port](https://www.tecmint.com/find-out-which-process-listening-on-a-particular-port/)
