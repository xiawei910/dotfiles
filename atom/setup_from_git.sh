sudo yum --assumeyes install make gcc gcc-c++ glibc-devel git-core libgnome-keyring-devel 
sudo yum --assumeyes install nodejs
echo "registry=https://registry.npm.taobao.org" >> ~/.npmrc
git clone https://github.com/atom/atom 
cd atom && script/build 
