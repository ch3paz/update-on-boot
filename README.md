# Description

Target-system here is __Archlinux__ but this may be easily adapted to any other package-manager.

__Warning:__

__This performs an UNATTENDED FULL SYSTEM UPGRADE on localhost__

Runs the play on system-boot-time to update the package-cache and install all updates. This is triggered via an systemd-service which uses ansible to perform the steps. A warning is displayed if a new kernel or the nvidia-package has been updated.

# Usage

* Install ansible
* Store this repository wherever you like
* __Adapt the paths__ in the file './additional/update-on-boot.service' to this location
* Copy 'update-on-boot.service' to '/etc/systemd/system/'
* Enable it:

~~~
systemctl enable update-on-boot.service
~~~

* Adapt './main.yml' to your needs (e.g. remove the "Send mail" task)
* Adapt the './files/updatecheck.archlinux.sh' if you like, here also the warnings and forced-reboot could be adjusted

__If you are still brave, REBOOT ;)__

# Hints

If you receive something like

"msg": "Could not upgrade"

from the pacman-module, there is likely an conflict that you need to resolve by hand.
