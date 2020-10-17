# Description


Warning:

__This performs an UNATTENDED FULL SYSTEM UPGRADE on localhost__

Runs the play on system-boot-time to update the package-cache and install all updates. This is triggered via an systemd-service which uses ansible to perform the steps.

# Usage

* Store this repository wherever you like
* __Adapt the paths__ in the file './additional/update-on-boot.service' to this location
* Copy 'update-on-boot.service' to '/etc/systemd/system/'
* Enable it:

~~~
systemctl enable update-on-boot.service
~~~

* Adapt './main.yml' to your needs (e.g. remove the "Send mail" task)
* Adapt the './files/updatecheck.archlinux.sh' if you like

And if you are still brave, REBOOT ;)
