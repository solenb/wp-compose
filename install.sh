#! /bin/bash
########	Install Dependency	########
echo -ne '|#                   |(0%)\r'
sleep 1 
echo -n $(sudo apt update > /dev/null 2>&1)
echo -ne '|##                  |(10%)\r'
sleep 1 
echo -n $(sudo apt install apt-transport-https > /dev/null 2>&1)
echo -n $(sudo apt install ca-certificates > /dev/null 2>&1)
echo -n $(sudo apt install curl > /dev/null 2>&1)
echo -ne '|####                |(20%)\r'
sleep 1 
echo -n $(sudo apt install gnupg-agent > /dev/null 2>&1)
echo -n $(sudo apt install software-properties-common > /dev/null 2>&1)
echo -ne '|######              |(30%)\r'
sleep 1

########	Install Docker		########
echo -n $(curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - > /dev/null 2>&1)
echo -n $(sudo apt-key fingerprint 0EBFCD88 > /dev/null 2>&1)
echo -ne '|########            |(40%)\r'
sleep 1 
echo -n $(sudo add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable" > /dev/null 2>&1)
echo -n $(sudo apt install docker-ce docker-ce-cli containerd.io > /dev/null 2>&1)
echo -ne '|##########          |(50%)\r'
sleep 1 
echo -n $(sudo docker run hello-world > /dev/null 2>&1)
echo -ne '|############        |(60%)\r'
sleep 1

########   Test de version Docker	########
echo -n $(sudo docker --version)
echo -ne '|##############      |(70%)\r'
sleep 1


########    Install Docker-Compose 	########
echo -n $(sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose > /dev/null 2>&1)
echo -ne '|################    |(80%)\r'
sleep 1 
echo -n $(sudo chmod +x /usr/local/bin/docker-compose > /dev/null 2>&1)


########   Test de version Docker-Compose	########
echo -n $(docker-compose --version)
echo -ne '|##################  |(90%)\r'
sleep 1


########	Création du dossier et montage du containeur  	########
echo -n $(cd /opt)
echo -n $(cd /wp-compose)
echo -n $(docker-compose docker-compose up -d) 
echo -ne '|####################|(100%)\r'
echo -ne '\n'
