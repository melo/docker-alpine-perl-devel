FROM melopt/alpine-perl-runtime

RUN apk --no-cache add build-base zlib-dev perl-dev libressl-dev \
                       expat-dev libxml2-dev

COPY build-perl-deps /usr/bin/
