#FROM python:2.7-slim
#WORKDIR /code_review
#ADD . /app
#RUN pip install --trusted-host pypi.python.org -r requirements.txt

FROM ubuntu:16.04

EXPOSE 22

#ENV NAME world

RUN apt-get update
RUN apt-get -y install apt-utils
RUN apt-get -y install zsh
RUN apt-get -y install vim
RUN apt-get -y install git
RUN apt-get -y install curl
RUN apt-get -y install wget
RUN apt-get -y install tmux
RUN apt-get -y install silversearcher-ag
RUN apt-get -y install ctags
RUN apt-get -y install cscope
RUN apt-get -y install cloc

RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN chsh -s /bin/zsh

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN ~/.fzf/install

ENV PATH="/root/.fzf/bin:${PATH}"

RUN git clone https://github.com/deanjerkovich/dotfiles.git && \
  cd dotfiles && \
  ./install.sh

RUN git config --global oh-my-zsh.hide-status 1

RUN mkdir -p ~/.vim/plugin/
RUN http://cscope.sourceforge.net/cscope_maps.vim -o ~/.vim/plugin/cscope_maps.vim

RUN mkdir /root/code_review

CMD ["/usr/bin/env","zsh"]
