#! /bin/sh
time=`date +%Y-%m-%d`
rootpath=/opt/codebackup/
giturl=$1
backfile=$2
backpath=$rootpath$time/$backfile
rm -rf $backpath
mkdir -p $backpath
cd $rootpath$time
git clone $giturl $backfile
zip -r $backpath.zip $backfile
rm -rf $backfile 