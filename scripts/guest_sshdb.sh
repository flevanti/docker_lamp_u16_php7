#!/bin/sh

# check if RFWEBESRVER is running for _THIS_ docker compose configuration
# this is needed because we assign names to containers so
# if multiple RF docker infrastructures are configure on your system
# the ssh command would connect to any running webserver container named RFWEBSERVER 
# even if not the one related to the folder you are in
# this is misleading and dangerous. 

c=$(docker-compose ps |grep RFDBSERVER -c)
if ((c == 0)) ; then
 echo "DB server container not running for this docker-compose configuration."
 exit
fi




# Looks like the db server container is running for THIS docker configuration
# this is good, let's go!
docker exec  -ti RFDBSERVER bash 
