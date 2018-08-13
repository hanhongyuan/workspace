# nginx设置域名映射虚拟目录

要把域名下某个虚拟目录使用nginx映射到内部站点有几点需要设置：

1. asp.net core 站点需要在`Startup.cs`文件添加以下内容：

```c#
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            //设置虚拟目录（可以设置多个）
            app.UsePathBase("/test");
            app.UsePathBase("/testweb");

            //原有配置
            if (env.IsDevelopment())
            {
                app.UseBrowserLink();
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
            }
            app.UseStaticFiles();
            app.UseMvc();
        }
```

这样asp.net core 站点的url跳转可以自动添加设置的虚拟目录（手动的url必须自行制定或使用相对路径）。

2. nginx需要进行如下设置，

```conf
   location /test/ { # nginx代理的虚拟目录
          proxy_pass http://localhost:5000/test/; # 站点的虚拟目录
        }
```
nginx代理的虚拟目录和站点的虚拟目录均需设置且一致。

3. 重启nginx后可使用虚拟目录访问。

```sh
nginx -s reload
```