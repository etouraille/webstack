FROM ubuntu:latest

RUN apt-get -qq update && apt-get -qq install -y  --no-install-recommends \
      git \
      curl \
      vim \
      build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN curl -skL https://deb.nodesource.com/setup_6.x -o script.sh

RUN bash script.sh

RUN rm script.sh

RUN apt-get install --yes nodejs

WORKDIR /src

RUN npm install -g bower

RUN npm install -g gulp-cli


