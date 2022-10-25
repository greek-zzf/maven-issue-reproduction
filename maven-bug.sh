#!/bin/sh

# 获取打包的版本信息
version=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)

# 移除无用的文件
rm -rf apache-maven-*

# maven 打包
mvn clean package -Dmaven.test.skip=true -Drat.skip=true

# 解压打包好的 zip 包 
unzip apache-maven-$version-bin.zip -d .

# 使用打包的 maven 编译项目
apache-maven-$version/bin/mvn -f /c/Users/zhouzhaofeng/Documents/maven-issue-reproduction/pom.xml compile


