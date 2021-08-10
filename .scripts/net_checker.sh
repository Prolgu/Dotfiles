#!/bin/bash

for interface in $(ls /sys/class/net/ | grep -v lo);
do
  if [[ $(cat /sys/class/net/$interface/carrier) = 1 ]];
  then OnLine=1;
  fi
done

if ! [ $OnLine ]; 
then echo "Offline" > /dev/stderr;
    # exit; 
else echo "Online" > /dev/stderr;
fi
