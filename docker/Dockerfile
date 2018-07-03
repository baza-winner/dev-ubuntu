
# ==============================================================================
# ==============================================================================

FROM ubuntu:14.04

MAINTAINER Yury Bikuzin <yury.bikuzin@baza-winner.ru>

# ==============================================================================
# borrowed from: https://github.com/creationix/nvm/blob/master/Dockerfile

# Install apt packages
RUN apt update         && \
    apt upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"  && \
    apt install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"     \
        coreutils             \
        util-linux            \
        bsdutils              \
        file                  \
        openssl               \
        ca-certificates       \
        ssh                   \
        wget                  \
        patch                 \
        sudo                  \
        htop                  \
        dstat                 \
        vim-gnome             \
        tmux                  \
        curl                  \
        git                   \
        jq                    \
        realpath              \
        zsh                   \
        ksh                   \
        gcc-4.8               \
        g++-4.8               \
        xz-utils              \
        build-essential       \
        bash-completion       \
    && apt-get clean

# ==============================================================================
# ============================ ru_RU.UTF-8 =====================================

# https://askubuntu.com/questions/76013/how-do-i-add-locale-to-ubuntu-server
# https://stackoverflow.com/questions/16507777/set-encoding-and-fileencoding-to-utf-8-in-vim
RUN \
  locale-gen ru_RU && \
  locale-gen ru_RU.UTF-8 && \
  update-locale && \
  echo "set encoding=utf-8" >> /etc/vim/vimrc && \
  echo "set fileencoding=utf-8" >> /etc/vim/vimrc && \
true

# ==============================================================================
# =============================== USER dev =====================================

# # Add user "dev" as non-root user && Set sudoer for "dev"
# RUN \
#   useradd -ms /bin/bash dev && \
#   echo 'dev ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
# true

# # Switch to user "dev" from now
# USER dev

# WORKDIR /home/dev/proj

# ENTRYPOINT /bin/bash

# ==============================================================================
# ==============================================================================
