FROM alpine:3.8

RUN apk --no-cache add curl wget perl make ca-certificates build-base  \
                       zlib-dev perl-dev openssl openssl-dev expat-dev \
                       gnupg libxml2 libxml2-dev libxml2-utils         \
    && curl -L https://cpanmin.us | perl - App::cpanminus              \
    && cpanm -n -q Carton                                              \
    && rm -rf ~/.cpanm
