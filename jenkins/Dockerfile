FROM jenkins
USER root
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update -y 
RUN apt-get install curl libunwind8 gettext apt-transport-https -y 
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
    && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
    && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/dotnetdev.list'
RUN  apt-get update -y \
    && apt-get install dotnet-sdk-2.0.0 -y
RUN export PATH=$PATH:$HOME/dotnet

RUN groupadd -o -g 999 docker && usermod -aG docker jenkins

