# Change apt-source
# https://developer.aliyun.com/mirror/ubuntu

# Sougou pingyin
# Support:
# https://pinyin.sogou.com/linux/guide
sudo apt-get install fcitx #Sougou pingyin
sudo cp /usr/share/applications/fcitx.desktop /etc/xdg/autostart/ #AutoStart
sudo apt install libqt5qml5 libqt5quick5 libqt5quickwidgets5 qml-module-qtquick2
sudo apt install libgsettings-qt1

# Latex
sudo apt-get install texlive-latex-base latex-cjk-all texlive-latex-extra texmaker texlive-xetex texlive-publishers latexmk

# pip
mkdir ~/.pip
echo "[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
[install]
trusted-host = https://pypi.tuna.tsinghua.edu.cn" > ~/.pip/pip.conf
