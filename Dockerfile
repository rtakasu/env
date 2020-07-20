# syntax=docker/dockerfile:experimental

# TODO: Not use latest
FROM debian:latest

COPY resolve.conf /etc/resolve.conf

RUN apt-get update && apt-get install \
      tig \
      neovim \
      zsh \
      tmux \
      openssh-client \
      silversearcher-ag \
      jq \
      tree \
      build-essential \
      libssl-dev \
      zlib1g-dev \
      libbz2-dev \
      libreadline-dev \
      libsqlite3-dev \
      wget \
      llvm \
      libncurses5-dev \
      libncursesw5-dev \
      xz-utils \
      tk-dev \
      libffi-dev \
      liblzma-dev \
      python-openssl \
      curl -y

# Install ohmyzsh
RUN sh -c "$(curl --fail -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Tmux package manager
RUN git clone https://github.com/tmux-plugins/tpm /root/.tmux/plugins/tpm

# Install rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly

WORKDIR /home/python_user

RUN git clone git://github.com/yyuu/pyenv.git .pyenv

ENV PYENV_ROOT /home/python_user/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

## Install python
RUN pyenv install -v 3.8.1 && \
      pyenv global 3.8.1

RUN pip install python-language-server --user && \
      pip install poetry --user && \
      pip install yapf --user && \
      pip install flake8 --user && \
      pip install mypy --user && \
      pip install pyls --user && \
      pip install isort --user && \
      pip install pynvim --user

WORKDIR /

# Install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git /root/.fzf && \
      /root/.fzf/install

COPY dotconfigs/.vimrc /root/.vimrc
COPY dotconfigs/init.vim /root/.config/nvim/init.vim

# Install Vundle and setup nvim
RUN git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim &&\
      vim +PluginInstall +qall && \
      git clone https://github.com/tomasr/molokai.git /root/.vim/molokai && \
      mkdir /root/.vim/colors && \
      cp /root/.vim/molokai/colors/molokai.vim /root/.vim/colors/molokai.vim

COPY dotconfigs/.psqlrc /root/.psqlrc
COPY dotconfigs/.tmux.conf /root/.tmux.conf
COPY dotconfigs/.zshrc /root/.zshrc

RUN mkdir -m 700 /root/.ssh; \
  touch -m 600 /root/.ssh/known_hosts; \
  ssh-keyscan github.com > /root/.ssh/known_hosts

# Load private repos
RUN --mount=type=ssh git clone git@github.com:rtakasu/virtual_library.git /root/virtual_library

CMD [tmux]
