FROM unclepro/php8.3-unit:latest

WORKDIR /app

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY unit-config.json /docker-entrypoint.d/config.json
COPY unit-config.json /etc/unit/unit.json

COPY docker/dev/entrypoint.sh /entrypoint.sh


ARG UID
ARG GID
ENV TARGET_UID ${UID:-1000}
ENV TARGET_GID ${GID:-1000}



RUN chmod +x /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]

