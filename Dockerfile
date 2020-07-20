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
      # TODO: Add vundle

RUN curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh || true


RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
      ~/.fzf/install
