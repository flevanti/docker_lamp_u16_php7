#!/bin/sh

# check if RFWEBESRVER is running for _THIS_ docker compose configuration
# this is needed because we assign names to containers so
# if multiple RF docker infrastructures are configure on your system
# the ssh command would connect to any running webserver container named RFWEBSERVER 
# even if not the one related to the folder you are in
# this is misleading and dangerous. 

if [ -d "./shared/webserver_bash_history" ] 
then
	echo converting bash history dir to file
	rm -r ./shared/webserver_bash_history
	touch ./shared/webserver_bash_history
fi

c=$(docker-compose ps |grep RFWEBSERVER -c)
if ((c == 0)) ; then
 echo "Webserver container not running for this docker-compose configuration."
 exit
fi




# Looks like the webserver container is running for THIS docker configuration
# this is good, let's go!
docker exec  -ti RFWEBSERVER bash 
