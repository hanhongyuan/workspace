1. 安装
   sudo pip install supervisor
2. 检查安装版本
   supervisord -v
3. 配置拷贝配置文件到目录下
4. 自动启动
    创建文件 touch /lib/systemd/system/supervisord.service
    内容：
    [Unit]
    Description=supervisor
    After=network.target
    
    [Service]
    ExecStart=/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
    ExecStop=/usr/bin/supervisorctl $OPTIONS shutdown
    ExecReload=/usr/bin/supervisorctl $OPTIONS reload
    Type=forking
    KillMode=process
    Restart=on-failure
    RestartSec=42s

    [Install]
    WantedBy=multi-user.target
5. 命令
    # 开机自动启动
    systemctl enable supervisord.service
    # 启动 supervisord
    systemctl start supervisord.service
    # 停止 supervisord
    systemctl stop supervisord.service
    # 重启 supervisord
    systemctl restart supervisord.service
