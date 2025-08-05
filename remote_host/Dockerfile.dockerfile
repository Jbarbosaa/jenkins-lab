FROM fedora

RUN yum -y install openssh-server iputils && \
    yum clean all && \
    rm -rf /var/cache/yum

RUN useradd -m -s /bin/bash remote_user

RUN mkdir -p /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh && \
    chown remote_user:remote_user /home/remote_user/.ssh

COPY authorized_keys /home/remote_user/.ssh/authorized_keys

RUN chmod 600 /home/remote_user/.ssh/authorized_keys && \
    chown remote_user:remote_user /home/remote_user/.ssh/authorized_keys

RUN ssh-keygen -A

EXPOSE 22

RUN yum -y install mariadb mariadb-server

RUN yum -y install python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install awscli

CMD ["/usr/sbin/sshd", "-D"]
