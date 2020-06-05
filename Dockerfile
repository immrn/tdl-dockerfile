FROM nvidia/cuda:10.2-cudnn7-devel

ENV DEBIAN_FRONTEND noninteractive

# install gnupg2, git, opencv
RUN apt-get update \
      && apt-get install --no-install-recommends --no-install-suggests -y gnupg2 ca-certificates \
            git build-essential libopencv-dev \
      && rm -rf /var/lib/apt/lists/*

COPY configure.sh /tmp/

# set changes to edit Makefile
ARG CONFIG=gpu-cudnn-half-cv-avx-mp-arch70
RUN chmod +x /tmp/configure.sh

RUN git clone https://github.com/AlexeyAB/darknet.git && cd darknet \
      && /tmp/configure.sh $CONFIG && make

# Download weights
# TODO: auf weigths im repo anpassen
RUN cd /darknet \
      && wget https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v3_optimal/yolov4.weights