
cd "C:\Program Files (x86)\VMware\VMware Workstation"
.\vmrun.exe stop "D:\Virtual Machines\Ubuntu 64 位 release\Ubuntu 64 位 release.vmx"
.\vmrun.exe stop "D:\Virtual Machines\Ubuntu 64 位 testmain\Ubuntu 64 位 testmain.vmx"
.\vmrun.exe stop "C:\Virtual Machines\Ubuntu 64 位 docker registry\Ubuntu 64 位 docker registry.vmx"
.\vmrun.exe stop "C:\Virtual Machines\Ubuntu 64 位 dev\Ubuntu 64 位 dev.vmx"
shutdown -s -t 600


.\vmrun.exe stop "C:\Virtual Machines\Ubuntu 64 位 mytest\Ubuntu 64 位 mytest.vmx"


cd "C:\Program Files (x86)\VMware\VMware Workstation"
.\vmrun.exe list



D:\Virtual Machines\Ubuntu 64 位 release\Ubuntu 64 位 release.vmx
D:\Virtual Machines\Ubuntu 64 位 testmain\Ubuntu 64 位 testmain.vmx
C:\Virtual Machines\Ubuntu 64 位 docker registry\Ubuntu 64 位 docker registry.vmx
C:\Virtual Machines\Ubuntu 64 位 dev\Ubuntu 64 位 dev.vmx

C:\Virtual Machines\Ubuntu 64 位 mytest\Ubuntu 64 位 mytest.vmx



cd "C:\Program Files (x86)\VMware\VMware Workstation"
.\vmrun.exe start "C:\Virtual Machines\Ubuntu 64 位 mytest\Ubuntu 64 位 mytest.vmx"
echo "mytest start"
.\vmrun.exe stop "C:\Virtual Machines\Ubuntu 64 位 mytest\Ubuntu 64 位 mytest.vmx"
echo "mytest stoped"


cd "C:\Program Files (x86)\VMware\VMware Workstation"
.\vmrun.exe start "D:\Virtual Machines\Ubuntu 64 λ release\Ubuntu 64 λ release.vmx"
.\vmrun.exe start "D:\Virtual Machines\Ubuntu 64 λ testmain\Ubuntu 64 λ testmain.vmx"
.\vmrun.exe start "C:\Virtual Machines\Ubuntu 64 λ docker registry\Ubuntu 64 λ docker registry.vmx"
.\vmrun.exe start "C:\Virtual Machines\Ubuntu 64 λ dev\Ubuntu 64 λ dev.vmx"


shutdown -s -t 600
cd "C:\Program Files (x86)\VMware\VMware Workstation"
.\vmrun.exe stop "D:\Virtual Machines\Ubuntu 64 λ release\Ubuntu 64 λ release.vmx"
.\vmrun.exe stop "D:\Virtual Machines\Ubuntu 64 λ testmain\Ubuntu 64 λ testmain.vmx"
.\vmrun.exe stop "C:\Virtual Machines\Ubuntu 64 λ docker registry\Ubuntu 64 λ docker registry.vmx"
.\vmrun.exe stop "C:\Virtual Machines\Ubuntu 64 λ dev\Ubuntu 64 λ dev.vmx"
shutdown -s -t 60
