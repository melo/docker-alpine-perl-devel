FROM alpine:latest

RUN apk --no-cache add curl wget perl make ca-certificates build-base  \
                       zlib-dev perl-dev openssl openssl-dev expat-dev \
                       gnupg                                           \
    && curl -L https://cpanmin.us | perl - App::cpanminus              \
    && cpanm -n -q Carton                                              \
    && rm -rf ~/.cpanm
