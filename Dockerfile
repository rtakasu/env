# TODO: Not use latest
FROM debian:latest

WORKDIR /root

RUN apt-get update && apt-get install \
      tig \
      neovim \
      zsh \
      tmux \
      openssh-client \
      silversearcher-ag \
      jq \
      tree \
      curl -y
      # TODO: Add vundle

# Install ohmyzsh
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Tmux package manager
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install pyenv
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Istall fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
      ~/.fzf/install

COPY dotconfigs/.psqlrc .psqlrc
COPY dotconfigs/.tmux.conf .tmux.conf
COPY dotconfigs/.vimrc .vimrc
COPY dotconfigs/.zshrc .zshrc
COPY dotconfigs/init.vim init.vim
