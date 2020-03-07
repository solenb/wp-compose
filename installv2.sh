#! /bin/bash

echo -en "Lancement du script d'installation de Docker et Docker-Compose\n"
sleep 3

test_compose=$(docker-compose --version)
test_docker=$(docker version)

if [ -n "$test_docker" ]; then
        echo -e "Docker Installé\n"
	if [ -n "$test_compose" ]; then
		echo -e "Docker-Compose Installé\n"
	else 
		echo -e "Docker-Compose n'est pas installé l'installation va démarrer\n"
		#### Install Docker ####
	apt-get update
	apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	software-properties-common
	fi
	if [  -n "$(uname -a | grep Ubuntu)" ]; then
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
		add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
		$(lsb_release -cs) \
		stable"
	else
		curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
		add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/debian \
		$(lsb_release -cs) \
		stable"
	fi

else    
	echo -e "Docker n'est pas installé l'installation de Docker va démarrer, suivie de Docker-Compose\n "     
	#### Install Docker ####
	apt-get update
	apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	software-properties-common
	if [  -n "$(uname -a | grep Ubuntu)" ]; then
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
		add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
		$(lsb_release -cs) \
	stable"
	else
		curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
		add-apt-repository \
		"deb [arch=amd64] https://download.docker.com/linux/debian \
		$(lsb_release -cs) \
		stable"
	fi
	#### Install Compose ####
	apt-get update
	apt-get install -y docker-ce docker-ce-cli containerd.io
	curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose

fi

dock_vers=$(docker version | sed -n "2p" | sed -e 's/ //g'|cut -d":" -f2)
comp_vers=$(docker-compose --version | cut -d" " -f3 |sed 's/,//g')
echo -e "Docker est installé (version $dock_vers) \n Docker Compose est installé (version $comp_vers)\n"


#### Launch Wp-Compose ####
echo -e "Voullez-vous mettre en production le containeur WordPress ? [y-n]\n"
read quest
if [[ $(echo $quest) = "y" ]]; then 
	echo -e "Mise en production du containeur\n"
	docker-compose up -d
elif [[ $(echo $quest) = "n" ]]; then 
	echo -e"Vous pourrez mettre le containeur (ou utiliser un autre fichier yaml), la mise en production a été stoppé\n"
else
	echo -e "La mise en production a été stoppé, veuillez remplir votre choix [y-n], en relançant le script\n"
fi


