FROM centos:7

RUN yum -y update
RUN yum -y install openssh-server
RUN yum -y install passwd

RUN useradd remote_user && \
    echo "12345678" | passwd remote_user --stdin && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY machine-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

RUN /usr/bin/ssh-keygen -A
EXPOSE 22
RUN rm -rf /run/nologin

RUN yum -y install mysql

#AWS CLI Installation
RUN yum -y install epel-release && \
    yum -y install python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install awscli

CMD /usr/sbin/sshd -D
