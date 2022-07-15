FROM archlinux:base-devel

RUN pacman --needed --noconfirm -Syu pacman-contrib git

# Add non-root user
RUN useradd -m builder && \
  echo 'builder ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers 

RUN chown builder:builder /home/builder -R 

# Switch user and cwd
USER builder
WORKDIR /home/builder

