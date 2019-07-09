1. 

cat > /usr/bin/cron.sh << EOF
#!/bin/sh
source /etc/profile;
source ~/.bash_profile;

etime=`date -d "0 days ago" +%Y%m%d_%H%M%S`

if [ "$1" = "-r" ] ; then
    echo "My God!No!No!No!"
    echo "Exit..."
    exit 2
fi

if [ "$1" = "-l" ] ; then
    /usr/bin/crontab -l
    exit 0
fi

if [ "$1" = "-e" ] ; then
    mkdir -p  ~/cronbak
    /usr/bin/crontab -l  >  ~/cronbak/cron.bak.$etime.a
    /usr/bin/crontab -e
    /usr/bin/crontab -l  >  ~/cronbak/cron.bak.$etime.b
fi

EOF

chmod 777 /usr/bin/cron.sh

2. 
echo "alias crontab='/usr/bin/cron.sh'" >> ~/.bashrc

source ~/.bashrc

