param($Services, $Sites)
# 重启服务
$sevList = $Services -split ','
foreach ($SevName in $sevList) {
    $server = Get-Service $SevName
    if ( $server.Status -ne 'Running') {
        Start-Service $SevName
        Write-Host 'restart' $SevName
    }
    else {
        Write-Host $SevName' is runing'
    }
}
# 重启站点
$siteList = $Sites -split ','
foreach ($SiteName in $siteList) {
    $statue = Get-Websitestate -Name $SiteName
    if ( $statue.Value -ne 'Started') {
        Start-WebSite -Name $SiteName
        Write-Host 'restart site:' $SiteName
    }
    else {
        Write-Host 'site:'$SiteName 'is runing'
    }
}