#! /bin/bash 

test=$(docker-compose --version)

if [ -n "$test" ];then
	echo "installé"

else 
	echo "fuck"	
fi
