FROM ubuntu:latest

RUN apt-get -qq update && apt-get -qq install -y  --no-install-recommends \
      git \
      curl \
      vim \
      build-essential \
      unzip \
      default-jre \
    && rm -rf /var/lib/apt/lists/*

RUN curl -skL https://deb.nodesource.com/setup_6.x -o script.sh

RUN bash script.sh

RUN rm script.sh

RUN apt-get install --yes nodejs

RUN npm install -g angular-cli@latest

#compiler

RUN curl -skL https://dl.google.com/closure-compiler/compiler-latest.zip -o compiler.zip

RUN unzip compiler.zip 

RUN rm compiler.zip

RUN mkdir -p /src

RUN mv closure-compiler-v* /src/compiler.jar

WORKDIR /src
