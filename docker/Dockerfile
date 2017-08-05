FROM fluent/fluentd:v0.12.39

COPY pkg/fluent-plugin-ufw-*.gem .
RUN gem install --local fluent-plugin-ufw-*.gem

COPY docker/etc/fluent.conf /fluentd/etc/
RUN mkdir /var/log/ufw/
COPY docker/var/log/ufw/ufw.log /var/log/ufw/
