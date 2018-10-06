FROM ubuntu:16.04
LABEL maintainer "Takashi Masuyama <mamewotoko@gmail.com>"

RUN apt-get update && apt-get upgrade -y && apt-get install -y ruby git ruby-bundler ruby-dev curl make gcc

# install fluentd (gem)
RUN curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-xenial-td-agent3.sh | sed 's:sudo ::g' | sh


RUN mkdir work

WORKDIR work
VOLUME work
