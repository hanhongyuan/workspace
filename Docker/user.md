docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}" |grep sjfx

docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}" |grep sjfx|sort -nk2 -r

echo "<html><body><table><tr><th>Name</th><th>CPU</th><th>MEM</th></tr>" > /web/publish-list/cpuuseage.html
echo `docker stats --no-stream --format "<tr><td>{{.Name}}</td><td> {{.CPUPerc}} </td><td>{{.MemUsage}}</td></tr>" |grep sjfx|sort -nk2 -r` >> /web/publish-list/cpuuseage.html
echo "</table></body></html>" >> /web/publish-list/cpuuseage.html

