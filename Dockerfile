FROM fluent/fluentd:v0.14.20

ARG UFW_VERSION=0.0.4

COPY pkg/fluent-plugin-ufw-${UFW_VERSION}.gem /tmp/
RUN gem install --local /tmp/fluent-plugin-ufw-${UFW_VERSION}.gem

COPY docker/etc/fluent.conf /fluentd/etc/
RUN mkdir /var/log/ufw/
COPY docker/var/log/ufw/ufw.log /var/log/ufw/
