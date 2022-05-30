FROM ubuntu:14.04.3

######## carga de variables de entorno ######
ARG DATABASE_URL
ENV DATABASE_URL $DATABASE_URL

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

####### actualizaciones #######
RUN apt-get update --fix-missing
RUN apt-get install -y curl
RUN apt-get install -y build-essential libssl-dev

####### instalación node #######
ENV NVM_DIR /usr/local/nvm
# version de node usado
ENV NODE_VERSION 16.2.0 

# Install nvm with node and npm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default 

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

####### instalción del proyecto #######
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npx prisma generate

EXPOSE 3001

CMD node server.js