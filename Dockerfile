FROM centos:centos6

MAINTAINER dockeryama

RUN yum update -y --nogpgcheck

RUN yum install wget tar bzip2 compat-gcc-34 compat-gcc-34-c++ -y --nogpgcheck

RUN ln -s /usr/bin/gcc34 /usr/bin/gcc
RUN ln -s /usr/bin/g++34 /usr/bin/g++

RUN mkdir ~/tmp && \
    cd ~/tmp && \
    wget https://googledrive.com/host/0B4y35FiV1wh7QVR6VXJ5dWExSTQ -O CRF++-0.58.tar.gz && \
    wget https://googledrive.com/host/0B4y35FiV1wh7cENtOXlicTFaRUE -O mecab-0.996.tar.gz && \
    wget https://googledrive.com/host/0B4y35FiV1wh7MWVlSDBCSXZMTXM -O mecab-ipadic-2.7.0-20070801.tar.gz && \
    wget https://googledrive.com/host/0B4y35FiV1wh7cGRCUUJHVTNJRnM/cabocha-0.69.tar.bz2 && \
    tar -xf CRF++-0.58.tar.gz && \
    tar -xf mecab-0.996.tar.gz && \
    tar -xf mecab-ipadic-2.7.0-20070801.tar.gz && \
    tar -xf cabocha-0.69.tar.bz2

RUN cd ~/tmp/CRF++-0.58 && \
    ./configure && make && make install

RUN cd ~/tmp/mecab-0.996 && \
    ./configure --with-charset=utf8 && make && make install

RUN cd ~/tmp/mecab-ipadic-2.7.0-20070801 && \
    ./configure --with-charset=utf8 && make && make install

RUN cd ~/tmp/cabocha-0.69 && \
    ./configure --with-charset=UTF8 && make && make install

RUN rm -rf ~/tmp
