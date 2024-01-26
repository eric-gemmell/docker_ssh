# Use the latest Ubuntu image
FROM ubuntu:latest

# Install SSH server and additional utilities
RUN apt-get update && \
    apt-get install -y openssh-server vim tree curl wget sl && \
    mkdir /var/run/sshd

# Set up a non-root user with sudo access (e.g., 'ubuntu')
# Replace 'your_password' with a secure password of your choice
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu && \
    echo 'ubuntu:lord' | chpasswd

# Install sudo to allow privilege escalation
RUN apt-get install -y sudo

# SSH login fix. Otherwise user is kicked off after login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Expose the SSH port
EXPOSE 22

# Start the SSH server
CMD ["/usr/sbin/sshd", "-D"]

