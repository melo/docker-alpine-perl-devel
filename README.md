# Alpine-Devel-Base #

This is a Docker image based on `alpine` that adds my essential build tools.

It is mostly focused on providing a decent Perl build environment, including:

* perl-5.26.1
* cpanm
* carton


# Recommended usage #

My usual project `Dockerfile` uses this image as the first stage, to build the application. The resulting files are then copied over to a new image, using [Docker multi-stage builds](https://docs.docker.com/engine/userguide/eng-image/multistage-build/).

An example:

```
FROM melopt/alpine-devel-base AS build

## Add any extra build time libs that you might need
## RUN apk --no-cache add <packages>

COPY cpanfile cpanfile.snapshot /app/
RUN  cd /app && carton install --deployment && rm -rf local/cache ~/.cpanm*

FROM alpine

## Add all run time libs and utils that you might need
## RUN apk --no-cache add <packages>

COPY --from=build /app /app

CMD ["your-app-startup"]
```

Enjoy your small Perl project images.


# Repository #

This image source repository is at https://github.com/melo/docker-alpine-devel-base.


# Author #

Pedro Melo
melo@simplicidade.org
