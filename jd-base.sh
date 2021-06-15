#version 1.0
#!/bin/bash
# 默认数据卷目录
export JD_HOME="/usr/local/data/jd_base"

sudo docker pull shuye72/jd-base:gitee;
sudo mkdir -p $JD_HOME/logs;
sudo mkdir -p $JD_HOME/config;
sudo mkdir -p $JD_HOME/scripts;

sudo docker stop jd-base;
sudo docker rm jd-base;

sudo docker run -d --name jd-base \
  -p 5678:5678 \
  -v $JD_HOME/logs:/jd/logs \
  -v $JD_HOME/config:/jd/config \
  -v $JD_HOME/scripts:/jd/scripts \
  --restart always \
  shuye72/jd-base:gitee;

# 如未修改用户名密码，则初始用户名为：admin，初始密码为：shuye72
# 请访问 http://<ip>:5678 登陆并修改配置...
