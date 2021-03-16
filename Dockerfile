FROM ubuntu:20.04

EXPOSE 22

RUN apt-get update && apt-get -y install python3 apt-utils python3-distutils zsh vim git curl wget tmux silversearcher-ag ctags cscope cloc && apt-get clean
RUN curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py 
RUN python3 /tmp/get-pip.py
RUN python3 -m pip install semgrep

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
