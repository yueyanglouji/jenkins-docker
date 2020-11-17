FROM jenkins/jenkins:lts-centos7

LABEL maintainer="lixiaobao<Xiaobao.Li@cn.yokogawa.com>"

USER root

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
RUN sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo
RUN yum install epel-release -y
RUN yum install ansible -y
RUN yum install python2-pip -y
RUN yum install python2-winrm -y
RUN curl --silent --location https://rpm.nodesource.com/setup_lts.x | bash -
RUN curl -o /etc/yum.repos.d/yarn.repo https://dl.yarnpkg.com/rpm/yarn.repo
RUN yum install nodejs -y
RUN yum install yarn -y
RUN yarn global add @vue/cli

USER jenkins