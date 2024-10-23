FROM php:8.3-alpine

ENV REVIEWDOG_VERSION=v0.9.17

RUN apk --no-cache add git
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
RUN wget -c https://phpmd.org/static/latest/phpmd.phar && mv phpmd.phar /usr/local/bin

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
