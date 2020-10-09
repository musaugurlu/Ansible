# Ansible
Ansible Automation for Azure IoC

## Usage
* Works on [Azure Shell](https://shell.azure.com)
* `cd` to location
* Run `ansible-playbook main.yml`
* Provide password when prompted
* By default, the application will be availabel at `http://luckylibrary.eastus2.cloudapp.azure.com`.
    * `.cloudapp.azure.com` part of the url cannot be changed unless a custom domain is assigned.
    * `.eastus2.` in the url comes from location.
    * only customizable part is `luckylibrary` part and it can be changed by assigning a different value to `vm_net_pip_dns_label` variable in `create_servers.yml` file.