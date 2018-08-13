param($appname, $sitename, $path, $apppool)
Remove-WebApplication -Name $appname -Site $sitename
New-WebApplication -Name $appname -Site $sitename -PhysicalPath $path -ApplicationPool $apppool
# New-WebApplication -Name 'test' -Site 'inside\dev' -PhysicalPath 'D:\code' -ApplicationPool 'inside_dev'
# Remove-WebApplication -Name 'test' -Site 'inside\dev'