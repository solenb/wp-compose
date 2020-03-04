# compose-wp

##############
Install Docker
##############

#1#
sudo apt-get update

#2#
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
    
#3#
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#4#
sudo apt-key fingerprint 0EBFCD88

#5#
sudo apt-get install docker-ce docker-ce-cli containerd.io

#test d'installation#
sudo docker run hello-world

######################
Install Docker-Compose
######################

#1#
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

#2#
sudo chmod +x /usr/local/bin/docker-compose

#test d'install#
docker-compose --version



#############################
Pour lancer le docker-compose 
#############################

Se place dans le fichier et lancer la commande :

docker-compose up -d 

