# sersync 同步文件夹

1. 下载安装

cd /opt

wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/sersync/sersync2.5.4_64bit_binary_stable_final.tar.gz

tar xf sersync2.5.4_64bit_binary_stable_final.tar.gz

cp -a GNU-Linux-x86 /usr/local/sersync

echo "PATH=$PATH:/usr/local/sersync" > /etc/profile.d/sersync.sh

source /etc/profile.d/sersync.sh

