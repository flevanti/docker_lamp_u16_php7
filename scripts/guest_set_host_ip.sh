#!/bin/sh
echo $1

if [ $# -eq 0 ]
  then
    echo "No IP argument supplied, trying to retrieve IP address using en0"
    ipconfig getifaddr en0 > host_machine_ip
    ip=$( cat host_machine_ip)
    if [ -z "$ip" ]
      then
        echo "Looks like network interface en0 didn’t provide any valid IP, trying en1…"
        ipconfig getifaddr en1 > host_machine_ip
    fi
  else
    echo "IP supplied $1"
    echo $1 > host_machine_ip
fi

ip=$( cat host_machine_ip)

echo IP address used is $ip

# docker exec -ti RFWEBSERVER bash --login -c "echo -e \"$ip mysql_host.local\\n\$(cat /etc/hosts |grep -v mysql_host.local)\" > /etc/hosts"
docker exec -ti RFWEBSERVER bash --login -c "echo -e \"$ip dockerhost\\n\$(cat /etc/hosts |grep -v dockerhost)\" > /etc/hosts"

echo your new guest machine hosts file is
docker exec -ti RFWEBSERVER bash --login -c "cat /etc/hosts"
