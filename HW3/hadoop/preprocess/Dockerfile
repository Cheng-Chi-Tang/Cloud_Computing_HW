#continue from ssh to install hadoop/spark
#FROM mlaccetti/docker-oracle-java8-ubuntu-16.04
FROM ubuntu:16.04
# Install.
ENV DEBIAN_FRONTEND noninteractive
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get update && apt-get install -y --no-install-recommends apt-utils && \
  apt-get install -y byobu curl git htop man unzip vim wget netcat && \
  apt-get install -y openssh-server sshpass && \
  apt-get install -y openjdk-8-jdk && \
  apt-get install -y procps && \
  apt-get install -y net-tools && \
  apt-get install -y findutils && \
  apt-get install -y scala && \
  apt-get install -y python && \
  apt-get install  -y python-pip && \
  pip install findspark && \
  apt-get install -f
  #rm -rf /var/lib/apt/lists/*
#RUN apt-get install -y --no-install-recommends apt-utils
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/' /etc/ssh/ssh_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Set environment variables.
ENV HOME /root
# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN ssh-keygen -f /root/.ssh/id_rsa -t rsa -N ''
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

#disable ipv6
RUN echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf && \
    echo 'net.ipv6.conf.default.disable_ipv6 = 1' >> /etc/sysctl.conf && \
    echo 'net.ipv6.conf.lo.disable_ipv6 = 1' >> /etc/sysctl.conf
