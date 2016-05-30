一.如何自动远程部署工程
1、第一步修改tomcat的"tomcat-users.xml"配置文件
	1)进入tomcat根目录中的conf目录下
	2)编辑"tomcat-users.xml"文件，在server节点下增加如下内容
   		<role rolename="manager-gui"/>     
		<role rolename="manager-script"/>     
		<user username="admin" password="123456" roles="manager-gui, manager-script"/>
		其中用户名与密码都可以自定义
	3)保存并关闭
2、第二步，配置"pom.xml"文件
	修改如下内容
		<configuration>
			<server>tomcat</server>
			<!-- 修改为刚才配置"tomcat-usrs.xml"中的用户名及密码
			<username>admin</username>  
			<password>123456</password>
			<!-- tomcat的管理url -->
			<url>http://10.0.0.253:8080/manager/text</url> 
			<contextReloadable>true</contextReloadable>
			<!-- 配置部署到tomcat中的最终工程名称 -->
			<finalName>${name}</finalName>
		</configuration>
3、第三步，
	当需要自动部署到远程tomcat服务器时，打war包的插件中的<warName>属性的注释不需要修改。
	当需要导出war包时且需要改变war包名称时，需要将<warName>属性的注释去掉，并改成想要的war名称，同时将自动远程部署的插件注释掉。
	如果warName配置不注释掉，会导致maven在远程部署时，出现找不到war包的情况。
4、tomcat中webapps的目录结构如下：
	  webapps
		  |___docs
		  |___examples
		  |___host-manager
		  |___manager
		  |___ROOT

二、打包工程，分为两种，一种是打war包，一种是打jar包
1、打war包，需要将自动远程部署的配置屏蔽，将<packaging>war</packaging>的内容设置为war，再执mvn package
2、打jar包，需要将自动远程部署的配置屏蔽，将<packaging>jar</packaging>的内容设置为jar，再执mvn package

三、打包过程是否执行junit
	<plugin>
		<groupId>org.apache.maven.plugins</groupId>
		<artifactId>maven-surefire-plugin</artifactId>
		<configuration>
			<!-- 
				如果设置为"true"则忽略junit测试，
				如果设置为"false"则进行junit测试
			-->
			<skip>true</skip>
		</configuration>
	</plugin>
  