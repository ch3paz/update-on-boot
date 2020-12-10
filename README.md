# Description

Target-system here is __Archlinux__ but this may be easily adapted to any other package-manager.

__Warning:__

__This performs an UNATTENDED FULL SYSTEM UPGRADE on localhost__

* Runs the play on system-boot-time to update the package-cache and install all updates.
* This is triggered via an systemd-service which uses ansible to perform the steps.
* A warning is mailed/displayed if a new kernel, or the nvidia-package, were updated.
* The script may be adjusted to just do an __forced-reboot without asking you again__ :) 
* The package-cache is cleared with 'paccache -k1 -r' on every boot.

# Installation

## Install by hand
* Install ansible
* Store this repository wherever you like
* __Adapt the paths__ in the file './files/update-on-boot.service' to this location
* Copy 'update-on-boot.service' to '/etc/systemd/system/'
* Enable it:

~~~
systemctl enable update-on-boot.service
~~~

* Adapt './main.yml' to your needs (e.g. remove the "Send mail" task)
* Adapt './vars/main.yml' to your needs (e.g. your mailrelay and your mailadress)
* Adapt the './files/updatecheck.archlinux.sh' if you like, here also the warnings __and forced-reboot__ could be adjusted/enabled
* Adapt all permissions (chmod/chown) to your needs

## Install with ansible

* Install ansible
* Adapt the files to your needs:

~~~
./main.yml
./vars/main.yml
./files/updatecheck.archlinux.sh
~~~

* Run as root:

~~~
ansible-playbook -i inventory install.yml 
~~~

__If you are still brave, REBOOT ;)__

# Hints

If you receive something like

"msg": "Could not upgrade"

from the pacman-module, there is likely an conflict that you need to resolve by hand.
