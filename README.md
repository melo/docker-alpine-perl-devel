# alpine-perl-devel #

[![Docker Pulls](https://img.shields.io/docker/pulls/melopt/alpine-perl-devel.svg)]()
[![Docker Build Status](https://img.shields.io/docker/build/melopt/alpine-perl-devel.svg)]()

This is a Docker image based on `alpine` that adds my essential tools to build perl projects.

This includes:

* [perl-5.26.1](https://metacpan.org/release/perl);
* [cpanm](https://metacpan.org/release/App-cpanminus);
* [carton](https://metacpan.org/release/Carton).

Some common *-dev libs are also included:

* openssl-dev: allows install of [Net::SSLeay](https://metacpan.org/release/Net-SSLeay);
* zlib-dev: for [Gzip::Faster](https://metacpan.org/release/Gzip-Faster);
* expat-dev: for all Expat-based XML parsers;
* libxml2-dev: allows install of [XML::LibXML](https://metacpan.org/release/XML-LibXML) and friends.


# Recommended usage #

My usual project `Dockerfile` uses this image as the first stage, to build the application. The resulting files are then copied over to a new image, using [Docker multi-stage builds](https://docs.docker.com/engine/userguide/eng-image/multistage-build/).

An example:

```
FROM melopt/alpine-perl-devel AS build

## Add any extra build time libs that you might need
## RUN apk --no-cache add <packages>

COPY cpanfile* /app/
RUN  cd /app && build-perl-deps

FROM melopt/alpine-perl-runtime

## Add all run time libs and utils that you might need
## RUN apk --no-cache add <packages>

COPY --from=build /app /app

CMD ["your-app-startup"]
```

Enjoy your small Perl project images.


# Extras

## build-perl-deps ##

A utility script is included, `build-perl-deps`, that checks
the current directory for a `cpanfile` and optionally
for a `cpanfile.snapshot`.

If found, it will use Carton to install your dependencies.

If all goes well, it will cleanup build and cache files to
keep your images small.

If an error is detected during the build process, a second
install is attempted, with`--verbose` and if the second one
also fails, the content of the ´cpanm` `build.log` file is printed.


# Repository #

This image source repository is at https://github.com/melo/docker-alpine-perl-devel.


# Author #

Pedro Melo
melo@simplicidade.org
