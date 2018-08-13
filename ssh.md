# ssh使用技巧

## 使用ssh keys登陆远程服务器

1. 在客户机生成keys ，

`ssh-keygen` 一路回车

2. 将key传到服务器

 `ssh-copy-id user@host`

 `ssh-copy-id root@192.168.1.14`

3. 再次登陆已不需要密码了

  `ssh user@host`
