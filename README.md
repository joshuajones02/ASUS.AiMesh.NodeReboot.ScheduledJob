### Start

##### SSH into ASUS router and execute the following

```bash
cd /jffs
mkdir scripts
cd scripts
touch pingcheck.sh
touch services-start
```

##### Enable jffs2
```shell
nvram set jffs2_on=1
nvram set jffs2_enable=1
#nvram set jffs2_format=1 
nvram set jffs2_scripts=1
nvram commit
reboot
```

##### After reboot, open pingcheck.sh and copy in contents of its file 

```bash
vi pingcheck.sh
```

##### Open services-start and copy in contents of its file

```shell
nvram set jffs2_exec="/jffs/scripts/services-start"
nvram commit
````
