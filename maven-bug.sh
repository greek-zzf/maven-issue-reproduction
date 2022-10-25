#!/bin/sh

# 移除无用的文件
rm -rf /c/Users/zhouzhaofeng/Documents/maven/apache-maven/target/

# maven 打包
mvn clean package -Dmaven.test.skip=true -Drat.skip=true

# 获取打包的版本信息
version=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)

# 解压打包好的 zip 包
OUTPUT_DIRECTOR=/c/Users/zhouzhaofeng/Documents/maven/apache-maven/target 
unzip $OUTPUT_DIRECTOR/apache-maven-$version-bin.zip

# 使用打包的 maven 编译项目
$OUTPUT_DIRECTOR/apache-maven-$version/bin/mvn -f /c/Users/zhouzhaofeng/Documents/maven-issue-reproduction/pom.xml compile


