useradd sjfxloger
passwd sjfxloger
passwd sjfxdev
cd /sjfxlogs/
chown -c sjfxloger /sjfxlogs/

sjfxloger
sjfx-2018

ssh sjfxloger@47.99.40.32   ssh sjfxloger@47.99.36.100  ssh sjfxloger@116.62.226.170 ssh sjfxloger@47.99.32.21
pwd:sjfx-2018
ls /sjfxlogs/
tail -f /sjfxlogs/back-user-1.log

useradd sjfx
mkdir /home/sjfx
chown -R 777 /home/sjfx/
usermod -d /home/sjfx sjfx
usermod -s /bin/bash sjfx
passwd sjfx


ssh root@proxy-local mkdir -p /home/sjfx/.ssh/ && chmod -R 777 /home/sjfx/ && cat >> /home/sjfx/.ssh/authorized_keys << EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCTlB/uHYarmjoYJGr0JYTCYLrP1f2yP9nDFjv7JmzINRKICh5F79THv0IMap0OOdLL1qjwp0DGVjDEVQJ/1molbR8gf72cgFtkhl2ni5RY3LUOJiZeaz221u9fpSOXLdpqEDvJqB1m7UAww03xhbvJr298mxz6pDf112bigPoaS9TkmpEJw0+EWkaudSdNFaTgMfxWKHnhlnQx8HJScnlV6JakblrWrXSQETTL3TF7nXEJvGALVwbZbxU11qq7bW4xO3pgVXjSo3oOA8pNJTyq7MV1FeERwiOXgMKN38g1qxKyOMexU0/x7mhyD541o9j7VWUzDXFV2Ckq2MhiyQ2X sjfx@v3-publish
EOF
