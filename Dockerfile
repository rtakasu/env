# TODO: Not use latest
FROM debian:latest

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

# Install ohmyzsh
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Tmux package manager
RUN git clone https://github.com/tmux-plugins/tpm /root/.tmux/plugins/tpm

# Install pyenv
RUN curl https://pyenv.run | bash

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
