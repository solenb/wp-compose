#! /bin/bash
######	Install Dependency	######
echo -n $(sudo apt update > /dev/null 2>&1)
echo -ne '###                       (16%)\r'
sleep 1
instDep= $(echo $(sudo apt install \ 
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg-agent \
	software-properties-common > /dev/null 2>&1))
echo -ne '######                    (33%)\r'
sleep 1
######	Install Docker		######
echo -n $(curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - > /dev/null 2>&1)
echo -n $(sudo apt-key fingerprint 0EBFCD88 > /dev/null 2>&1)
echo -n $(sudo add-apt-repository \
	"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	$(lsb_release -cs) \
	stable" > /dev/null 2>&1)
echo -n $(sudo apt install docker-ce docker-ce-cli containerd.io > /dev/null 2>&1)
echo -n $(sudo docker run hello-world > /dev/null 2>&1)
echo -ne '#############             (66%)\r'
sleep 1
###### Test de version Docker	######
echo -n $(sudo docker --version > /dev/null 2>&1)

######	Install Docker-Compose 	######
echo -n $(sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose > /dev/null 2>&1)
echo -n $(sudo chmod +x /usr/local/bin/docker-compose > /dev/null 2>&1)
echo -ne '#######################   (100%)\r'
echo -ne '\n'

