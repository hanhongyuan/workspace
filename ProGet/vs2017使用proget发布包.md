---
typora-root-url: images
typora-copy-images-to: images
---

### 环境

- ProGet```Version 5.0.10 (Build 5)```,部署在CentOs7

- VS2017

### 安装ProGet
安装过程请参考[官方文档](https://inedo.com/support/documentation/proget/docker/private-registries)，使用docker安装，比较简单。
不过有几点注意事项：
1. 安装好后务必使用域名，不要带端口，否则会在下载安装包时报如下错误 ：

   ![52185700743](/1521857007430.png)

2. ​


### VS中下载安装包

1. 设置包源

   ![52185711181](/1521857111818.png)

   ![52185716146](/1521857161465.png)

   2. 下载包

      ![52185721534](/1521857215347.png)

设置好后就能够浏览下载包了。

### Nuget Push包到ProGet

1. 获取api key

   在ProGet上申请账号，然后添加API Keys中添加key，具体如下

   ![52185732086](/1521857320869.png)

   ![52185737514](/1521857375145.png)

   ![52185739140](/1521857391408.png)

   这里要注意Feed API User及权限勾选，如果不清楚就全部选上。具体不太清楚具体作用，估计是可以调用 公开的api接口等等，但我们用不到，直接使用nuget就可以了。

2. 在开发机器上设置api key

   官方文档链接 ：https://docs.microsoft.com/zh-cn/nuget/tools/cli-ref-setapikey

   ![52185752320](/1521857523201.png)

3. 发布包

   设置包信息，如下

   ![52185762164](/1521857621646.png)

   点保存，然后点发布，然后就能够看到发布的包的位置等。

   ```powershell
   1>------ 已启动生成: 项目: Sjfxsoft.Infrastructure, 配置: Release Any CPU ------
   1>Sjfxsoft.Infrastructure -> D:\Solution\V8MP\SJFX.PlatformV3\src\Infrastructure\Infrastructure\bin\Release\netstandard2.0\Sjfxsoft.Infrastructure.dll
   1>已成功创建包“D:\Solution\V8MP\SJFX.PlatformV3\src\Infrastructure\Infrastructure\bin\Release\Sjfxsoft.Infrastructure.1.0.9.nupkg”。
   ========== 生成: 成功 1 个，失败 0 个，最新 0 个，跳过 0 个 ==========
   ```

   复制包的位置，然后在```程序包管理器控制台```输入

   ```
   Windows PowerShell
   版权所有 (C) Microsoft Corporation。保留所有权利。

   PS C:\Users\wenbo> nuget push D:\Solution\V8MP\SJFX.PlatformV3\src\Sjfxsoft.WeChat\Sjfxsoft.WeChat.App\bin\Release\Publi
   shOutput\Sjfxsoft.WeChat.App.1.0.4.nupkg -source http://nuget.sjfx.com.cn/nuget/sjfx/
   Pushing Sjfxsoft.WeChat.App.1.0.4.nupkg to 'http://nuget.sjfx.com.cn/nuget/sjfx/'...
     PUT http://nuget.sjfx.com.cn/nuget/sjfx/
     Created http://nuget.sjfx.com.cn/nuget/sjfx/ 565ms
   Your package was pushed.
   PS C:\Users\wenbo>
   ```

   可以看到提示，包已上传。

   ![52185788490](/1521857884900.png)