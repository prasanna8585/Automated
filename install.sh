
#. ./config.cfg
#sudo apt-get update

#sudo apt-get install -y libcurl4-openssl-dev
#sudo apt-get install -y libssl-dev
#sudo apt-get install -y jq
#sudo apt-get install -y ruby-full
#sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
#sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
#sudo apt-get install -y python-setuptools
#sudo apt-get install -y libldns-dev
#sudo apt-get install -y python3-pip
#sudo apt-get install -y python-pip
#sudo apt-get install -y python-dnspython
#sudo apt-get install -y git
#sudo apt-get install -y rename

#if [[ -z "$GOPATH" ]];then
#echo "It looks like go is not installed, would you like to install it now"
#PS3="Please select an option : "
#choices=("yes" "no")
#select choice in "${choices[@]}"; do
#        case $choice in
#                yes)
#
#					echo "Installing Golang"
#					wget https://dl.google.com/go/go1.18.5.linux-amd64.tar.gz
#					sudo tar -xvf go1.18.5.linux-amd64.tar.gz
#					sudo rm f /usr/local/go
#					sudo mv go /usr/local
#					export GOROOT=/usr/local/go
#					export GOPATH=$HOME/go
#					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
#					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
#					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
#					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
#					source ~/.bash_profile
#					sleep 1
#					break
#					;;
#				no)
#					echo "Please install go and rerun this script"
#					echo "Aborting installation..."
#					exit 1
#					;;
#	esac	
#done
#fi

#create a tools folder in ~/
#mkdir ~/tools
#cd ~/tools/
#
#
#echo "Installing subfinder"
#go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
#echo "#######################################################################################################################################################################"
#
#echo "installing waybackurls"
#go install github.com/tomnomnom/waybackurls@latest
#echo "#######################################################################################################################################################################"
#
#echo "installing httpx"
#go install github.com/projectdiscovery/httpx/cmd/httpx@latest
#echo "#######################################################################################################################################################################"




#!/bin/bash

. ./config.cfg

echo -e "${BOLD}${YELLOW}\n"
echo -e "
 ██████╗██╗   ██╗██████╗ ███████╗██████╗ ███████╗██╗   ██╗███████╗    
██╔════╝╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗██╔════╝╚██╗ ██╔╝██╔════╝    
██║      ╚████╔╝ ██████╔╝█████╗  ██████╔╝█████╗   ╚████╔╝ █████╗      
██║       ╚██╔╝  ██╔══██╗██╔══╝  ██╔══██╗██╔══╝    ╚██╔╝  ██╔══╝      
╚██████╗   ██║   ██████╔╝███████╗██║  ██║███████╗   ██║   ███████╗    
 ╚═════╝   ╚═╝   ╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝    
                                                                      "
echo -e "\n\n${NORMAL}"

sudo apt-get -y update

echo -e "${BOLD}${MAGENTA}Installing programming languages\n${NORMAL}"
 
echo -e "${CYAN}Installing Python\n${NORMAL}"
sudo apt-get install -y python3-pip
sudo apt-get install -y dnspython
sudo apt install -y whois
echo -e "${CYAN}Installing GO\n\n${NORMAL}"
sudo apt install -y golang
export GOROOT=/usr/lib/go
export GOPATH=~/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

echo "export GOROOT=/usr/lib/go" >> ~/.bashrc
echo "export GOPATH=~/go" >> ~/.bashrc
echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> ~/.bashrc

source ~/.bashrc

echo -e "${CYAN}Installing Cargo\n\n${NORMAL}"
sudo apt install cargo

echo -e "${CYAN}Installing html2text\n\n${NORMAL}"
sudo apt install html2text

echo -e "${BOLD}${MAGENTA}Installing repositories\n${NORMAL}"
cd $HOME
mkdir tools
cd tools

echo -e "${CYAN}Cloning ASNLookup\n${NORMAL}"
git clone https://github.com/yassineaboukir/Asnlookup
cd Asnlookup
pipx install  requirements.txt
cd ..

echo -e "${CYAN}Cloning ssl-checker\n${NORMAL}"
git clone https://github.com/narbehaj/ssl-checker
cd ssl-checker
pipx install  requirements.txt
cd ..

echo -e "${CYAN}Cloning CloudEnum\n${NORMAL}"
git clone https://github.com/initstring/cloud_enum
cd cloud_enum
pipx install  requirements.txt
cd ..

echo -e "${CYAN}Cloning GitDorker\n${NORMAL}"
git clone https://github.com/obheda12/GitDorker
cd GitDorker
pipx install  requirements.txt
cd ..

echo -e "${CYAN}Cloning RobotScraper\n${NORMAL}"
git clone https://github.com/robotshell/robotScraper.git

echo -e "${CYAN}Install Arjun\n${NORMAL}"
pipx install arjun

echo -e "${CYAN}Cloning nuclei-templates\n${NORMAL}"
git clone https://github.com/projectdiscovery/nuclei-templates.git


echo -e "${CYAN}Cloning Corsy\n${NORMAL}"
git clone https://github.com/s0md3v/Corsy.git
cd Corsy
pipx install requests
cd ..	

echo -e "${CYAN}Cloning SecretFinder\n${NORMAL}"
git clone https://github.com/m4ll0k/SecretFinder.git secretfinder
cd secretfinder
pipx install  requirements.txt
cd ..

echo -e "${CYAN}Cloning CMSeek\n${NORMAL}"
git clone https://github.com/Tuhinshubhra/CMSeeK
cd CMSeeK
pipx install  requirements.txt
cd ..

echo -e "${CYAN}Cloning Findomain\n${NORMAL}"
git clone https://github.com/findomain/findomain.git
cd findomain
cargo build -elease
sudo cp target/release/findomain /usr/bin/
cd ..

echo -e "${CYAN}Cloning anti-burl\n${NORMAL}"
git clone https://github.com/tomnomnom/hacks
cd hacks/anti-burl/
go build main.go
sudo mv main ~/go/bin/anti-burl
cd ..

echo -e "${CYAN}Cloning XSRFProbe\n${NORMAL}"
git clone https://github.com/s0md3v/Bolt
cd Bolt
pipx install  requirements.txt
cd ..

echo -e "${CYAN}Cloning Gf-Patterns\n${NORMAL}"
git clone https://github.com/1ndianl33t/Gf-Patterns
mkdir ~/.gf
cp  Gf-Patterns/* ~/.gf
cd ..
cd ..

	
echo -e "${BOLD}${MAGENTA}Installing tools\n${NORMAL}"

echo -e "${CYAN}Installing WhatWeb\n\n${NORMAL}"
sudo apt-get install whatweb

echo -e "${CYAN}Installing TheHarvester\n\n${NORMAL}"
sudo apt-get install theharvester

echo -e "${CYAN}Installing Nmap\n\n${NORMAL}"
sudo apt-get install nmap

echo -e "${CYAN}Installing Dirsearch\n\n${NORMAL}"
sudo apt-get install dirsearch

echo -e "${CYAN}Installing SqlMap\n\n${NORMAL}"
sudo apt-get install sqlmap 

echo -e "${CYAN}Installing Amass\n${NORMAL}"
go install -v go install -v github.com/OWASP/Amass/v3/..@latest
sudo cp ~/go/bin/amass /usr/local/bin 

echo -e "${CYAN}Installing Aquatone\n${NORMAL}"
go install github.com/michenriksen/aquatone
sudo cp ~/go/bin/aquatone /usr/local/bin 

echo -e "${CYAN}Installing Subfinder\n${NORMAL}"
GO111MODULE=on go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
sudo cp ~/go/bin/subfinder /usr/local/bin 

echo -e "${CYAN}Installing Hakrawler\n${NORMAL}"
go install github.com/hakluke/hakrawler@latest
sudo cp ~/go/bin/hakrawler /usr/local/bin 

echo -e "${CYAN}Installing anew\n${NORMAL}"
go install github.com/tomnomnom/anew
sudo cp ~/go/bin/anew /usr/local/bin 

echo -e "${CYAN}Installing HTTPX\n${NORMAL}"
GO111MODULE=on go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
sudo cp ~/go/bin/httpx /usr/local/bin

echo -e "${CYAN}Installing Notify\n${NORMAL}"
GO111MODULE=on go install -v github.com/projectdiscovery/notify/cmd/notify@latest
sudo cp ~/go/bin/notify /usr/local/bin

echo -e "${CYAN}Installing Nuclei\n${NORMAL}"
GO111MODULE=on go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
sudo cp ~/go/bin/nuclei /usr/local/bin

echo -e "${CYAN}Installing Shcheck\n${NORMAL}"
git clone https://github.com/santoru/shcheck

echo -e "${CYAN}Installing MailSpoof\n${NORMAL}"
sudo pipx install mailspoof

echo -e "${CYAN}Installing MailSpoof\n${NORMAL}"
go install github.com/haccer/subjack@latest
sudo cp ~/go/bin/subjack /usr/local/bin

echo -e "${CYAN}Installing gau\n${NORMAL}"
GO111MODULE=on go install -v github.com/lc/gau@latest
sudo cp ~/go/bin/gau /usr/local/bin

echo -e "${CYAN}Installing gf\n${NORMAL}"
go install  github.com/tomnomnom/gf@latest
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
cp  $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf
sudo cp ~/go/bin/gf /usr/local/bin

echo -e "${CYAN}Installing qsreplace\n${NORMAL}"
go install github.com/tomnomnom/qsreplace@latest
sudo cp ~/go/bin/qsreplace /usr/local/bin

echo -e "${CYAN}Installing Dalfox\n${NORMAL}"
GO111MODULE=on go install -v github.com/hahwul/dalfox/v2@latest
sudo cp ~/go/bin/dalfox /usr/local/bin

echo -e "${CYAN}Installing html-tool\n${NORMAL}"
go install github.com/tomnomnom/hacks/html-tool@latest
sudo cp ~/go/bin/html-tool /usr/local/bin

echo -e "${CYAN}Installing waybackurls\n${NORMAL}"
go install github.com/tomnomnom/waybackurls@latest
