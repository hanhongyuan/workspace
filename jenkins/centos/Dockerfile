FROM docker pull centos
USER root
RUN yum install epel-release -y && yum update -y && yum install wget -y

RUN yum install java-1.8.0-openjdk.x86_64 -y

RUN yum clean packages -y &&

RUN cp /etc/profile /etc/profile_backup \
    && echo 'export JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk' | tee -a /etc/profile \
    && echo 'export JRE_HOME=/usr/lib/jvm/jre' | tee -a /etc/profile \
    && source /etc/profile

RUN cd ~ \
    && wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
    && rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
    && yum install jenkins -y

# 将 shell 替换为 bash 并 upgrade
RUN rm /bin/sh && ln -s /bin/bash /bin/sh \
    && apt-get update && apt-get install -y git curl \
    && apt-get install curl libunwind8 gettext apt-transport-https \
    && curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
    && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
    && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/dotnetdev.list' \
    && apt-get update \
    && apt-get install dotnet-sdk-2.0.0 -y \
    && export PATH=$PATH:$HOME/dotnet \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd -o -g 999 docker && usermod -aG docker jenkins

