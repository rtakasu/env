# TODO: Not use latest
FROM debian:latest

RUN apt-get update && apt-get install \
    neovim git zsh \
    tmux openssh-client \
    curl -y

RUN curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh || true
