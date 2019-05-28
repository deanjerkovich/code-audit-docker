FROM ubuntu:16.04

EXPOSE 22

RUN apt-get update && apt-get -y install apt-utils zsh vim git curl wget tmux silversearcher-ag ctags cscope cloc && apt-get clean

RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN chsh -s /bin/zsh

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN ~/.fzf/install

ENV PATH="/root/.fzf/bin:${PATH}"

RUN git clone https://github.com/deanjerkovich/dotfiles.git && \
  cd dotfiles && \
  ./install.sh

RUN git config --global oh-my-zsh.hide-status 1

RUN mkdir -p ~/.vim/plugin
RUN curl http://cscope.sourceforge.net/cscope_maps.vim -o ~/.vim/plugin/cscope_maps.vim

RUN mkdir /root/code_review

CMD ["/usr/bin/env","zsh"]
