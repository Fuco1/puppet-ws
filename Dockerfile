FROM ubuntu:xenial

RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

EXPOSE 22

# Create and configure vagrant user
RUN useradd --create-home -s /bin/bash ubuntu
WORKDIR /home/ubuntu

# Configure SSH access
RUN echo -n 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Generate host keys
RUN ssh-keygen -A

# Enable passwordless sudo for the "ubuntu" user
RUN mkdir -p /etc/sudoers.d
RUN install -b -m 0440 /dev/null /etc/sudoers.d/ubuntu
RUN echo 'ubuntu ALL=NOPASSWD: ALL' >> /etc/sudoers.d/ubuntu

CMD ["/usr/sbin/sshd", "-D"]
