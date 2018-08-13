
sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher

修改 hostname
echo "master" > /etc/hostname

生成 ssh pem file 
ls -al ~/.ssh
没有需要生成
ssh-keygen -t rsa -C "zengzhi@sjfx.com.cn"

转换成pem
ssh-keygen -e -f ~/.ssh/id_rsa.pub > ~/.ssh/id_rsa_pub.pem



docker pull rancher/rancher-agent:v2.0.0            
docker pull rancher/hyperkube:v1.10.1-rancher2  
docker pull rancher/rke-tools:v0.1.4            
docker pull rancher/nginx-ingress-controller:0.10.2-rancher3   
docker pull rancher/calico-node:v3.1.1            
docker pull rancher/calico-cni:v3.1.1            
docker pull rancher/coreos-etcd:v3.1.12           
docker pull rancher/pause-amd64:3.1               
docker pull rancher/coreos-flannel:v0.9.1            
