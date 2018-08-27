# Check if running with root permissions
if [ `id -u` -ne 0 ]; then
        printf "Please run as root or use sudo\n"
        printf "sudo pcms_install.sh\n"
        exit 1
fi
#Use package manager to install all necessary dependencies 
apt-get -y install git
git config --global http.sslCAinfo /etc/ssl/certs/ca-certificates.crt
apt-get -y install openjdk-8-jdk
apt-get -y install nodejs
apt-get -y install maven
apt-get -y install npm
if [ ! -d "pcms" ]; then
        sudo -u $SUDO_USER mkdir pcms
fi
cd pcms
regex="([0-9]+.[0-9]+.[0-9]+)"
#Install Percli if not already installed
if [[ ! `percli --version` =~ $regex ]]; then
        npm install percli -g
fi
#Install Peregrine server
if [ ! -d "out" ] || [ ! "$(ls -A ./out)" ]; then
        sudo -u $SUDO_USER percli server install -d
fi
#if [ ! -d "sling" ]; then
#	sudo -u $SUDO_USER percli server start
#fi
#cd ..
#Copy latest version of peregrine source code
#sudo -u $SUDO_USER git clone git://github.com/headwirecom/peregrine-cms
#cd peregrine-cms
#Switch to the development branch
#sudo -u $SUDO_USER git checkout -b origin/develop
#Build and deploy latest version of Peregrine
#sudo -u $SUDO_USER percli compile -d
#cd ..
~                                      
