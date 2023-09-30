FROM ubuntu:22.04

EXPOSE 22

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=/opt/anaconda3/bin:$PATH
ENV JAVA_HOME=/usr/lib/jvm/java-17-oracle
ENV PATH=$PATH:$JAVA_HOME/bin

# Install basic development tools
# gcc, g++
RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

# Install openssh-server
RUN apt-get update && apt-get install -y openssh-server && rm -rf /var/lib/apt/lists/*
RUN mkdir /var/run/sshd

# RUN echo 'root:1234' | chpasswd
# RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN adduser --disabled-password --gecos "" donga
RUN echo donga:donga | chpasswd

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
