FROM node:lts-alpine

ENV BUILD_DEPS="gettext yarn"  \
    RUNTIME_DEPS="libintl curl"
    
RUN set -x && \
    apk add --update $RUNTIME_DEPS && \
    apk add --virtual build_deps $BUILD_DEPS &&  \
    yarn global add envsub 

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl  && \
    chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
    
RUN apk del build_deps    
