FROM ubuntu:18.04

RUN apt update

RUN apt install -y python3 python3-dev
RUN apt install -y python3-pip

RUN pip3 install numpy
RUN pip3 install pandas
RUN pip3 install matplotlib
RUN pip3 install Cython
RUN pip3 install pycocotools

RUN pip3 install -U numpy==1.16

RUN apt install -y doxygen

RUN apt install -y texlive

RUN apt install -y texlive-latex-extra
