yum -y install yum-fastestmirror
sudo yum update
sudo yum -y install google-chrome-stable --nogpgcheck
sudo yum install shadowsocks-qt5 --nogpgcheck
sudo yum -y --nogpgcheck install https://mirrors.tuna.tsinghua.edu.cn/epel/epel-release-latest-7.noarch.rpm
yum install ntfs-3g
sudo wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
sudo yum -y install ntfs-3g
