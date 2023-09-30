FROM ubuntu:22.04

EXPOSE 22

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=/opt/anaconda3/bin:$PATH
ENV JAVA_HOME=/usr/lib/jvm/java-17-oracle
ENV PATH=$PATH:$JAVA_HOME/bin

# Install basic development tools
# gcc, g++
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    wget \
    nano \
    sudo \
    flex \
    bison \
    bzip2 \
    ca-certificates \
    libglib2.0-0 \
    libxext6 \ 
    libsm6 \
    libxrender1 \
    mercurial \
    subversion \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js using NodeSource
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs

# Install Anaconda
RUN wget https://repo.anaconda.com/archive/Anaconda3-2023.07-2-Linux-x86_64.sh -O anaconda.sh && \
    bash anaconda.sh -b -p /opt/anaconda3 && \
    rm anaconda.sh && \ 
    echo "source /opt/anaconda3/etc/profile.d/conda.sh" >> ~/.bashrc

# Install Java 17
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:linuxuprising/java && \
    apt-get update && \
    echo oracle-java17-installer shared/accepted-oracle-license-v1-3 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java17-installer && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk17-installer

# Install openssh-server
RUN apt-get update && apt-get install -y openssh-server && rm -rf /var/lib/apt/lists/*
RUN mkdir /var/run/sshd

# RUN echo 'root:1234' | chpasswd
# RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

COPY create_user.sh /root/

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
