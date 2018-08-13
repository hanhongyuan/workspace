param($website, $configpath)
$webapp = Get-WebApplication -Name $website 
$oldconfigpath = $webapp.PhysicalPath + "\appsettings.json" 
xcopy $oldconfigpath $configpath /Y