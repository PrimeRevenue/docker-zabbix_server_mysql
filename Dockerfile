FROM zabbix/zabbix-server-mysql:ubuntu-4.0.4
COPY --chown=zabbix:zabbix ./env_secrets_expand.sh /
COPY --chown=zabbix:zabbix ./docker-entrypoint.sh /usr/bin/
COPY --chown=zabbix:zabbix mibs.tar.gz /tmp/mibs.tar.gz
RUN tar xzf /tmp/mibs.tar.gz -C /var/lib/zabbix/mibs/
RUN chown -R zabbix:zabbix /var/lib/zabbix/mibs
RUN chmod ug+x /usr/bin/docker-entrypoint.sh
ENTRYPOINT  ["docker-entrypoint.sh"]
