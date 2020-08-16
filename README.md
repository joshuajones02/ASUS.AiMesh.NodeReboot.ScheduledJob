## Start

#### SSH into ASUS router and execute the following

```shell
cd /jffs
mkdir scripts
cd scripts
touch pingcheck.sh
touch services-start
```

#### Enable jffs2
```shell
nvram set jffs2_on=1
nvram set jffs2_enable=1
#nvram set jffs2_format=1 
nvram set jffs2_scripts=1
nvram commit
reboot
```

#### After reboot, open pingcheck.sh

```shell
vi pingcheck.sh
```

#### Paste in content

```shell 
if ! ping -w 10 -c 10 1.1.1.1 > /dev/null; then
sleep 240
#wait 4 minutes in case of another router in reboot cycle.
if ! ping -w 10 -c 10 1.1.1.1 > /dev/null; then
reboot
fi
fi
```

#### Open services-start and copy in contents of its file

```shell
#!/bin/sh
cru a NoPingReboot "*/15 * * * * /jffs/scripts/pingcheck.sh"
```

#### Commit services-start to nvram to run cron upon reboot

```shell
nvram set jffs2_exec="/jffs/scripts/services-start"
nvram commit
````

#### To verify, reboot again and check cron

```shell
cru l
```
