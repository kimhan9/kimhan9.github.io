# MITRE Caldera

MITRE Caldera is a cyber security platform designed to easily automate adversary emulation, assist manual red-teams, and automate incident response.[^1]

## Installation on x86 machine[^2]

```
sudo apt install python3-pip python3-venv python3-dev
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt

sudo apt install npm
python3 server.py --insecure --build

# Golang 1.22 install
echo "Installing Golang 1.22"
sudo wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
sudo tar -C /usr/local/ -xvf go1.22.0.linux-amd64.tar.gz  
echo "export GOROOT=/usr/local/go" >> /home/ubuntu/.profile
echo "export GOPATH=$HOME/go" >> /home/ubuntu/.profile 
echo "export PATH=$PATH:/usr/local/go/bin" >> /home/ubuntu/.profile

sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go

sudo apt-get install -y apt-transport-https ca-certificates gnupg2 
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa --yes
sudo apt install upx -y
sudo apt install python3.9 -y
sudo apt install python3-pip -y
sudo apt-get install haproxy -y
# Upgrade pyOpenSSL - weird issue only impacting AWS EC2 AMI images
pip3 install --upgrade pyOpenSSL

# Install NodeJS for Caldera 5.0 requirement
curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

# Installing docker needed by VECTR
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

## Docker deployment

```
# Install required tool
sudo apt install git docker.io -y
sudo usermod -aG docker $(whoami)
# Relogin the system

# Make docker image
git clone https://github.com/mitre/caldera.git --recursive
cd caldera
docker build --build-arg WIN_BUILD=true . -t caldera:latest

# Run docker image
docker run -p 8888:8888 caldera:latest
docker run -p 7010:7010 -p 7011:7011/udp -p 7012:7012 -p 8888:8888 caldera:latest

# Edit if use public IP
cd plugins/magma
# vi .env and enter following line
VITE_CALDERA_URL=http://<server IP>:8888

# Get login password
docker exec -it naughty_wu cat conf/local.yml
```


[^1]:[Calera homepage](https://caldera.mitre.org/)
[^2]:[Bootstrap](https://github.com/iknowjason/AutomatedEmulation/blob/master/files/bas/bootstrap.sh.tpl)