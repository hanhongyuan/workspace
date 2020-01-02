#!/bin/sh
#autossh -M 7771 -R 7770:localhost:8000 dbselect@47.94.47.162
#!/bin/sh
ps -ef | grep autossh | awk '{print $2}' | xargs kill
ps -ef | grep 'ssh -NR' | awk '{print $2}' | xargs kill -9
ps -ef | grep 'ssh -gfNT' | awk '{print $2}' | xargs kill -9
nohup autossh -f -M 0 -NfR 7790:localhost:8000 sshredirect@47.94.47.162 &
nohup autossh -f -M 0 -NfR 7791:192.168.1.11:8111 sshredirect@47.94.47.162 &
nohup autossh -f -M 0 -NfR 7792:192.168.1.11:8112 sshredirect@47.94.47.162 &
nohup autossh -f -M 0 -NfR 7793:192.168.1.11:8113 sshredirect@47.94.47.162 &
nohup autossh -f -M 0 -NfR 7794:192.168.1.11:8114 sshredirect@47.94.47.162 &
nohup autossh -f -M 0 -NfR 7797:192.168.1.11:22 sshredirect@47.94.47.162 &

#proxy
nohup ssh -gfNT -D :7600 sshredirect@47.94.47.162 &
./docker_privoxy/start-proxy.sh test
