1. 安装java8和tomcate8
2. 后端改名为api.war 复制倒webapps
3. 前端复制倒webapps\ROOT
4. 发布配置：
后端
```
gradle build
git log --graph --pretty=format:'%h [%ci] -%cn %s %b %d ' --abbrev-commit --date=relative > release.list
version=`cat release.list |head -1|awk -F ' ' '{print $2}'`
version='1.0.0.'${BUILD_ID}'-'${version}
projectname='lubin-api'
mkdir -p /mnt/publish/lubin
cp -f ./build/libs/*.war /mnt/publish/lubin/$projectname'-'$version'.war'
cp -f release.list /mnt/publish/lubin/$projectname'-'$version'.list'
```
前端
```
yarn install
yarn run build
git log --graph --pretty=format:'%h [%ci] -%cn %s %b %d ' --abbrev-commit --date=relative > release.list
version=`cat release.list |head -1|awk -F ' ' '{print $2}'`
version='1.0.0.'${BUILD_ID}'-'${version}
projectname='lubin-web'
mkdir -p /mnt/publish/lubin
zip -r /mnt/publish/lubin/$projectname'-'$version'.zip' dist
```