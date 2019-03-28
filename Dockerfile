FROM melopt/alpine-perl-runtime

RUN apk --no-cache add build-base zlib-dev perl-dev openssl-dev        \
                       expat-dev libxml2-dev
