echo -n "Lancement du script d'installation de Docker et Docker-Compose"

apt-get update
apt-get install -y \
linux-image-extra-$(uname -r) \
linux-image-extra-virtual
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
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
#echo -n
docker-compose --version
