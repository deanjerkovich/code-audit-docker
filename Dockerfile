#FROM python:2.7-slim
#WORKDIR /code_review
#ADD . /app
#RUN pip install --trusted-host pypi.python.org -r requirements.txt

FROM ubuntu:16.04

EXPOSE 22

#ENV NAME world

RUN apt-get update
RUN apt-get -y install zsh
RUN apt-get -y install vim
RUN apt-get -y install git
RUN apt-get -y install curl
RUN apt-get -y install apt-utils
RUN apt-get -y install wget

RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN chsh -s /bin/zsh

RUN git clone https://github.com/deanjerkovich/dotfiles.git && \
  cd dotfiles && \
  ./install.sh

CMD ["/usr/bin/env","zsh"]
