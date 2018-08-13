# ASPDotNetELK安装部署

ELK = Elasticsearch , Logstash, Kibana,在ASPDotNet中我们使用NLog记录日志

## ELK的安装（环境要求JDK1.8和Node.js请自行下载安装）

    1. windows：

        1.下载ELK，请注意三个程序要使用同一版本，我们选用6.2.2版本（5.X和6.X差异较大，5.X请参考网络教程），下载地址

        [elasticsearch](https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.2.2.zip)

        [kibana](https://artifacts.elastic.co/downloads/kibana/kibana-6.2.2-windows-x86_64.zip)

        [logstash](https://artifacts.elastic.co/downloads/logstash/logstash-6.2.2.zip)

        2.下载完成后解压elasticsearch，安装x-pack插件,在解压后bin目录执行
        ```ps
        ps> .\elasticsearch-plugin install x-pack
        ```

        3.执行elasticsearch，bin目录执行
        ```ps
        ps> .\elasticsearch
        ```

        4.生成用户名密码，bin目录执行（注意：请妥善保存好用户名密码）
        ```ps
        ps> .\x-pack/setup-passwords auto
        ```
        访问[http://localhost:9200/](http://localhost:9200/)会显示相关版本号

        5.解压Kibana，安装x-pack插件,在解压后bin目录执行
        ```ps
        ps> .\kibana-plugin install x-pack
        ```

        6.修改kibana配置文件`config\kibana.yml`，增加elasticsearch用户名密码：(如果前面修改了elasticsearch的配置，也请同步修改相关配置项目)
        ```yml
        elasticsearch.username: "kibana"
        elasticsearch.password: "youpassword"
        ```

        7.启动并访问kibana，bin目录执行
        ```ps
        ps> .\kibana
        ```
        通过[http://localhost:5601](http://localhost:5601)可以访问站点

        8.解压logstash，修改配置文件`config\logstash.yml`
        ```yml
        path.data: youdatapath
        path.config: youconfigpath
        path.logs: youlogspath
        ```
        在配置文件目录创建`nlog.conf`，内容：
        ```conf
        input {
            tcp{
                host => "localhost"
                port => 8001
            }
        }
        filter {
            grok{
                match => {
                    "message" => "#%{DATA:request_time}#%{DATA:node_name}#%{DATA:class_name}#%{DATA:log_level}#%{DATA:call_site}#%{DATA:line_number}#%{DATA:request_url}#%{DATA:request_method}#%{DATA:container_name}#%{DATA:action_name}#%{DATA:log_info}#%{DATA:exception_msg}#"
                }
            }
        }
        output {
            elasticsearch {
                hosts => ["localhost:9200"]
                index => "service_api"
                document_type => "logs"
                codec=>"json"
                user => elastic
                password => youpassword
            }
        }
        ```
        grok语法[参考](https://www.elastic.co/guide/en/logstash/current/plugins-filters-grok.html)

        9.指定配置文件`nlog.conf`logstash，`bin`目录执行
        ```ps
        ps> .\logstash -f ..\config\nlog.conf
        ```

        10.作为服务安装：

        elasticsearch可以使用elasticsearch-service install来安装windows服务。

        kibana 和 logstash可以使用NSSM安装。

    2. docker：

        1. 下载基础镜像
        ```sh
        docker pull docker.elastic.co/elasticsearch/elasticsearch:6.3.1
        docker pull docker.elastic.co/kibana/kibana:6.3.1
        docker pull docker.elastic.co/logstash/logstash:6.3.1

        ```

        2. 创建ELK目录,上传docker-compose及相关文件并解压
        ```sh
        mkdir /opt/elk
        cd /opt/elk
        unzip docker-elk-public.zip
        rm -rf docker-elk-public.zip
        ```

        3. 修改权限
        ```sh
        mkdir -p /mnt/elk/elasticsearchdata/
        mkdir -p /mnt/elk/logstashdata/
        mkdir -p /mnt/elk/logstashlog/        
        chmod 777 /opt/elk/elasticsearchdata/
        chmod 777 /opt/elk/logstashdata/
        chmod 777 /opt/elk/logstashlog/
        ```

        4. 启动镜像
        ```sh
        docker-compose up -d
        ```

        5. 开启端口
        ```sh
        firewall-cmd --zone=public --add-port=5601/tcp
        firewall-cmd --zone=public --add-port=5601/tcp --permanent
        firewall-cmd --zone=public --add-port=6666/tcp
        firewall-cmd --zone=public --add-port=6666/tcp --permanent
        firewall-cmd --zone=public --add-port=9200/tcp
        firewall-cmd --zone=public --add-port=9200/tcp --permanent
        firewall-cmd --zone=public --add-port=9300/tcp
        firewall-cmd --zone=public --add-port=9300/tcp --permanent
        ```

## NLog配置

    1. NLog安装，使用nuget安装，注意现在一定要使用预发行版本，`csprj`文件:
        ```xml
        <PackageReference Include="NLog.Extensions.Logging" Version="1.0.0-rtm-rc7" />
        <PackageReference Include="NLog.Web.AspNetCore" Version="4.5.0-rc3" />
        ```
        要比这个版本新否则不能使用

    2. 添加NLog配置文件`nlog.config`，内容：
        ```xml
        <?xml version="1.0" encoding="utf-8" ?>
        <nlog xmlns="http://www.nlog-project.org/schemas/NLog.xsd"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            autoReload="true"
            internalLogLevel="Warn"
            internalLogFile="internal-nlog.txt">
        <extensions>
            <!--enable NLog.Web for ASP.NET Core-->
            <add assembly="NLog.Web.AspNetCore"/>
        </extensions>

        <!-- define various log targets -->
        <!--定义日志文件目录-->
        <variable name="logDirectory" value="${basedir}/logs/${shortdate}"/>
        <variable name="nodeName" value="node1"/>

        <targets async="true">
            <!-- 全部日志target -->
            <target xsi:type="File"
                    name="allfile"
                    fileName="${logDirectory}/nlog-all/${shortdate}.log"
                    layout="#node1#${longdate}#${logger}#${uppercase:${level}}#${callsite}#${callsite-linenumber}#${aspnet-request-url}#${aspnet-request-method}#${aspnet-mvc-controller}#${aspnet-mvc-action}#${message}#${exception:format=ToString}#"
                    keepFileOpen="false"
                    />
            <!-- 本地文件日志target -->
            <target xsi:type="File"
                    name="ownLog-file"
                    fileName="${logDirectory}/nlog-${level}/${shortdate}.log"
                    layout="#${longdate}#${nodeName}#${logger}#${uppercase:${level}}#${callsite}#${callsite-linenumber}#${aspnet-request-url}#${aspnet-request-method}#${aspnet-mvc-controller}#${aspnet-mvc-action}#${message}#${exception:format=ToString}#"
                    keepFileOpen="false"
                    />
            <!-- Tcp日志target -->
            <target xsi:type="Network"
                    name="ownLog-tcp"
                    keepConnection="false"
                    address ="tcp://127.0.0.1:8001"
                    layout="#${longdate}#${nodeName}#${logger}#${uppercase:${level}}#${callsite}#${callsite-linenumber}#${aspnet-request-url}#${aspnet-request-method}#${aspnet-mvc-controller}#${aspnet-mvc-action}#${message}#${exception:format=ToString}#"
                    />
            <!--grok 规则-->
            <!--%#{DATA:request_time}#%{DATA:node_name}#%{DATA:class_name}#%{DATA:log_level}#%{DATA:call_site}#%{DATA:line_number}#%{DATA:request_url}#%{DATA:request_method}#%{DATA:container_name}#%{DATA:action_name}#%{DATA:log_info}#%{DATA:exception_msg}#-->
            <!--空白-->
            <target xsi:type="Null" name="blackhole" />
        </targets>

        <!--日志级别 Trace -》Debug-》 Info -》Warn-》 Error-》 Fatal-->
        <!--日志规则-->
        <rules>
            <!--全部日志, 包括Microsoft日志-->
            <logger name="*" minlevel="Trace" writeTo="allfile" />

            <!--自定义日志，排除Microsoft日志-->
            <logger name="Microsoft.*" minlevel="Trace" writeTo="blackhole" final="true" />
            <logger name="*" minlevel="Debug" writeTo="ownLog-file" />
            <logger name="*" minlevel="Info" writeTo="ownLog-tcp" />
        </rules>
        </nlog>
        ```

    3. 在项目文件引用NLog记录日志
        修改 Program.cs
        ```c#
                public static IWebHost BuildWebHost(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .UseStartup<Startup>()
                .UseNLog()
                .Build();
        ```
        修改 Startup.cs
        ```c#
        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            env.ConfigureNLog("nlog.config");

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseMvc();
        }
        ```
    
    4. 使用和以前一样。


    for i in `docker images|grep sjfx/ |awk '{print $1 88888 $2 }'|sed "s/88888/:/g"`;do echo \ &&  docker rmi $i; done