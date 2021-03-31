FROM ubuntu:20.04

# 会安装依赖包 tzdata，设置以下2个环境变量，避免安装 tzdata 时弹出输入框
#ENV DEBIAN_FRONTEND noninteractive
#ENV TZ Asia/Shanghai

# 链接可能会失效，官方会替换成新版本
#ADD http://archive.ubuntu.com/ubuntu/pool/universe/j/janus/janus-tools_0.10.9-1_amd64.deb /root/
ADD janus-tools_0.10.9-1_amd64.deb /root/

RUN apt-get update \
#    && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y /root/janus-tools_0.10.9-1_amd64.deb

