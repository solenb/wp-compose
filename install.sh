#! /bin/bash
########	Install Dependency	########
echo -e "Sur qu'elle distribution êtes-vous ? \n Ubuntu ou Debian ? [ub-de]"
read quest
if [ $(echo $quest) = "de" ] || [ $(echo $quest) = "ub" ];then 
	echo -ne '|#                   |(0%)\r'
	sleep 1 
	echo -n $(sudo apt update --yes > /dev/null 2>&1)
	echo -ne '|##                  |(10%)\r'
	sleep 1 
	echo -n $(sudo apt install apt-transport-https --yes > /dev/null 2>&1)
	echo -n $(sudo apt install ca-certificates --yes > /dev/null 2>&1)
	echo -n $(sudo apt install curl --yes > /dev/null 2>&1)
	echo -ne '|####                |(20%)\r'
	sleep 1 
	echo -n $(sudo apt install software-properties-common --yes > /dev/null 2>&1)

	if [[ $(echo $quest) = "ub" ]];then 
		echo -n $(sudo apt install gnupg-agent --yes > /dev/null 2>&1)
		echo -n $(curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -  > /dev/null 2>&1)
	else 
		echo -n $(sudo apt install gnupg2 --yes > /dev/null 2>&1)
		echo -n $(curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -  > /dev/null 2>&1)
	fi		
	echo -ne '|######              |(30%)\r'
	sleep 1

	########	Install Docker		########
	echo -n $(sudo apt-key fingerprint 0EBFCD88 > /dev/null 2>&1)
	echo -ne '|########            |(40%)\r'
	sleep 1 

	if [[ $(echo $quest) = "ub" ]];then 
		echo -n $(sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /dev/null 2>&1)
	else 
		echo -n $(sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /dev/null 2>&1)
	fi	
	echo -n $(sudo apt install docker-ce docker-ce-cli containerd.io --yes > /dev/null 2>&1)
	echo -ne '|##########          |(50%)\r'
	sleep 1 
	echo -n $(sudo docker run hello-world > /dev/null 2>&1)
	echo -ne '|############        |(60%)\r'
	sleep 1

	########   Test de version Docker	########
	#echo -n $(sudo docker --version \n)
	echo -ne '|##############      |(70%)\r'
	sleep 1


	########    Install Docker-Compose 	########
	echo -n $(sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose > /dev/null 2>&1)
	echo -ne '|################    |(80%)\r'
	sleep 1 
	echo -n $(sudo chmod +x /usr/local/bin/docker-compose > /dev/null 2>&1)


	########   Test de version Docker-Compose	########
	echo -ne $(docker-compose --versioni \n\t)
	echo -ne '|##################  |(90%)\r'
	sleep 1


	########	Création du dossier et montage du containeur  	########
	#echo -n $(cd /opt)
	#echo -n $(cd /wp-compose)
	#echo -n $(docker-compose up -d) 
	echo -ne '|####################|(100%)\r'
	echo -ne '\n'

else
	echo -e "Mauvais système d'exploitation veuillez en choisir un correcte. \n Ubuntu ou Debian [ub-de]"
	exit 0
fi

