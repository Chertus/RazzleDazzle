# Standard Go installation
curl -O https://dl.google.com/go/go1.21.1.linux-amd64.tar.gz
sudo rm -rf /usr/local/go 
sudo tar -C /usr/local -xzf go1.21.1.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.bashrc
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> $HOME/.bashrc
source $HOME/.bashrc

# Install protobuf compiler and Go plugins
sudo apt update && sudo apt upgrade
sudo apt install protobuf-compiler
go get -u -v google.golang.org/protobuf
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest

# Install node using nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install 19.8.0

# Navigate to the project directory (assuming you have cloned it to 'wotlk')
cd wotlk

# Install the npm package dependencies using node
npm install
