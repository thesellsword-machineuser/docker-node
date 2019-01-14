FROM ubuntu:16.04

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y -q --no-install-recommends \
        curl \
        software-properties-common \
        vim \
        git \
        libssl-dev \
        build-essential && \
    rm -rf /var/lib/apt/lists/*

ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 10.14.1

RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash && \
    source $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default

ENV NODE_PATH   $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH        $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN npm install -g nodemon
RUN npm install -g knex
RUN npm install -g ts-node
RUN npm install -g typescript
