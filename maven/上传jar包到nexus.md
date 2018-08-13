# 上传jar包到nexus

## 通过网页上传

很简单通过[地址](http://maven.sjfx.com.cn/#browse/upload:maven-releases),填写信息上传就可以了。
逼格基本为0.

## 通过IDEA上传

1. 修改maven的设置文件，文件在`[你的IDEA安装目录]\plugins\maven\lib\maven3\conf\settings.xml`

   - 在 `servers` 节点下添加：

   ```xml
       <server>
         <id>sjfx-snapshots</id>
         <username>***</username>
         <password>***</password>
       </server>
       <server>
         <id>sjfx-releases</id>
         <username>***</username>
         <password>***</password>
       </server>
   ```

   - 在 `mirrors`  节点下添加：

   ```xml
       <mirror>
         <id>sjfx</id>
         <name>sjfx maven</name>
         <url>http://maven.sjfx.com.cn/repository/maven-public/</url>
         <!--mirrorOf>central</mirrorOf-->   
         <mirrorOf>*</mirrorOf>   
       </mirror>
   ```

   

   - 在 `profiles`  节点下添加：

   ```xml
   <profile>
         <id>nexus</id>
         <!--Enable snapshots for the built in central repo to direct -->
         <!--all requests to nexus via the mirror -->
         <repositories> 
           <repository> 
               <id>nexus</id> 
               <name>local private nexus</name> 
               <url>http://maven.sjfx.com.cn/repository/maven-public/</url>
               <releases><enabled>true</enabled><updatePolicy>always</updatePolicy>
               <checksumPolicy>warn</checksumPolicy></releases> 
               <snapshots><enabled>false</enabled></snapshots> 
           </repository>        
         </repositories> 
         <pluginRepositories> 
           <pluginRepository> 
               <id>nexus</id> 
               <name>local private nexus</name> 
               <url>http://maven.sjfx.com.cn/repository/maven-public/</url> 
               <releases><enabled>true</enabled><updatePolicy>always</updatePolicy>
               <checksumPolicy>warn</checksumPolicy></releases> 
               <snapshots><enabled>false</enabled></snapshots> 
           </pluginRepository>        
          </pluginRepositories> 
       </profile>
   ```

    

2. 需要发布的项目的``文件添加：

   ```xml
       <distributionManagement>
           <repository>
               <id>sjfx-releases</id>
               <name>Nexus Release Repository</name>
               <url>http://maven.sjfx.com.cn/repository/maven-releases/</url>
           </repository>
           <snapshotRepository>
               <id>sjfx-snapshots</id>
               <name>Nexus Snapshot Repository</name>
               <url>http://maven.sjfx.com.cn/repository/maven-snapshots/</url>
           </snapshotRepository>
       </distributionManagement>
   
   ```

   这里的id要和 `settings.xml` 文件中的 `servers` 节点对应。

3. 现在你可以通过IDEA的Maven Project窗口的package和deploy发布到nexus了。

