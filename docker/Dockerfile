
# ==============================================================================
# ==============================================================================

FROM ubuntu:14.04

MAINTAINER Yury Bikuzin <yury.bikuzin@baza-winner.ru>

# ==============================================================================
# borrowed from: https://github.com/creationix/nvm/blob/master/Dockerfile

# Prevent dialog during apt install
ENV DEBIAN_FRONTEND noninteractive

# Pick a Ubuntu apt mirror site for better speed
# ref: https://launchpad.net/ubuntu/+archivemirrors
ENV UBUNTU_APT_SITE ubuntu.cs.utah.edu

# Disable src package source
RUN sed -i 's/^deb-src\ /\#deb-src\ /g' /etc/apt/sources.list

# Replace origin apt package site with the mirror site
RUN sed -E -i "s/([a-z]+.)?archive.ubuntu.com/$UBUNTU_APT_SITE/g" /etc/apt/sources.list
RUN sed -i "s/security.ubuntu.com/$UBUNTU_APT_SITE/g" /etc/apt/sources.list

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
# =============================== dumb-init  ===================================
# https://github.com/Yelp/dumb-init

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64
RUN chmod +x /usr/local/bin/dumb-init
ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD [ "bash" ]

# ==============================================================================
# ============================= openssh-server =================================
# https://docs.docker.com/engine/examples/running_ssh_service/

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN sudo /usr/bin/ssh-keygen -A
EXPOSE 22

# ==============================================================================
# ================================ locale ======================================

# https://www.thomas-krenn.com/en/wiki/Configure_Locales_in_Ubuntu
# RUN update-locale ru_RU.utf8

# https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-ubuntu-docker-container/28406007#28406007
# Set the locale
RUN locale-gen en_US.UTF-8
# RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# Skype:

# 2018-08-16 17:53
# Алексей, хотел уточнить, какая локаль используется на наших Ubuntu-серверах в production?

# Алексей 2018-08-16 17:58
# специально не задаем, по умолчанию на разных дистрибутивах, по разному, где C.UTF-8, где en_US.UTF-8

# ==============================================================================
# =============================== USER dev =====================================

# Add user "dev" as non-root user && Set sudoer for "dev"
RUN \
  useradd -ms /bin/bash dev && \
  echo 'dev ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
true

# Switch to user "dev" from now
USER dev

WORKDIR /home/dev/proj

# ==============================================================================
# ==============================================================================

# все добавки к .bashrc далее будем писать в ._bashrc
# приходиться использовать ._bashrc, т.к. в .bashrc есть блокировка от его 
# исполнения в неинтерактивном режиме (наверное, обосоновання)
# чтобы можно было прочитать "наши" настройки в неинтерактином режиме, 
# используем для их хранения ._bashrc
RUN echo ". $HOME/._bashrc" >> "$HOME/.bashrc" 

# ==============================================================================
# ==============================================================================

# https://docs.docker.com/engine/examples/running_ssh_service/#environment-variables
RUN echo ". $HOME/proj/docker/main.env" >> "$HOME/._bashrc"

# ==============================================================================
# ================================ nvm =========================================

COPY nvm /home/dev/.nvm
RUN sudo chown -R dev $HOME/.nvm
RUN echo 'export NVM_DIR="$HOME/.nvm"' >> $HOME/._bashrc
RUN echo '. "$NVM_DIR/nvm.sh"  # This loads nvm' >> $HOME/._bashrc
RUN echo '. "$NVM_DIR/bash_completion" # This loads nvm bash_completion' >> $HOME/._bashrc

# ==============================================================================
# ==============================================================================
