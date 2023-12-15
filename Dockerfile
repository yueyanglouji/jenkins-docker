FROM jenkins/jenkins:lts

LABEL maintainer="lixiaobao<343468684@qq.com>"

USER root
ENV SHELL=/bin/bash
ENV NVM_NODEJS_ORG_MIRROR=https://npmmirror.com/mirrors/node/
ENV LC_ALL="C.UTF-8"

RUN mv /etc/apt/sources.list.d /etc/apt/sources.list.d.bak \
&& echo "\
deb https://mirrors.aliyun.com/debian/ bookworm main non-free contrib\
" > /etc/apt/sources.list\
&& echo "\
deb-src https://mirrors.aliyun.com/debian/ bookworm main non-free contrib\
" >> /etc/apt/sources.list\
&& echo "\
deb https://mirrors.aliyun.com/debian-security/ bookworm-security main\
" >> /etc/apt/sources.list\
&& echo "\
deb-src https://mirrors.aliyun.com/debian-security/ bookworm-security main\
" >> /etc/apt/sources.list\
&& echo "\
deb https://mirrors.aliyun.com/debian/ bookworm-updates main non-free contrib\
" >> /etc/apt/sources.list\
&& echo "\
deb-src https://mirrors.aliyun.com/debian/ bookworm-updates main non-free contrib\
" >> /etc/apt/sources.list\
&& echo "\
deb https://mirrors.aliyun.com/debian/ bookworm-backports main non-free contrib\
" >> /etc/apt/sources.list\
&& echo "\
deb-src https://mirrors.aliyun.com/debian/ bookworm-backports main non-free contrib\
" >> /etc/apt/sources.list

RUN apt-get update \
&& apt-get install ansible -y


RUN git config --global http.proxy http://10.48.211.3:8118 \
&& curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh --proxy http://10.48.211.3:8117 | bash
RUN /bin/bash -c 'source ~/.bashrc \
&& nvm install 20.10.0 \
&& nvm use 20.10.0 \
&& npm config set registry https://repo.yokogawa.work/repository/npm-yokogawa/ \
&& npm install --global yarn \
&& git config --global --unset http.proxy'

