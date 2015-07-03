#!/usr/bin/env bash

MYSQLD_HOST="$(echo "${MYSQLD_PORT}" | sed 's/tcp:\/\///')"

export FACTER_MYSQLD_HOST="$(echo "${MYSQLD_HOST}" | cut -d ":" -f1)"
export FACTER_MYSQLD_PORT="$(echo "${MYSQLD_HOST}" | cut -d ":" -f2)"

ZABBIX_SERVER_HOST="$(echo "${ZABBIX_SERVER_PORT}" | sed 's/tcp:\/\///')"

export FACTER_ZABBIX_SERVER_HOST="$(echo "${ZABBIX_SERVER_HOST}" | cut -d ":" -f1)"
export FACTER_ZABBIX_SERVER_PORT="$(echo "${ZABBIX_SERVER_HOST}" | cut -d ":" -f2)"

if [ -z "${SERVER_NAME}" ]; then
  SERVER_NAME="localhost"
fi

export FACTER_SERVER_NAME="${SERVER_NAME}"

if [ -z "${PROTOCOLS}" ]; then
  PROTOCOLS="https,http"
fi

PROTOCOLS=$(echo "${PROTOCOLS}" | tr "," "\n")

for PROTOCOL in ${PROTOCOLS}; do
  if [ "${PROTOCOL}" == "http" ]; then
    export FACTER_HTTP="1"
  fi

  if [ "${PROTOCOL}" == "https" ]; then
    export FACTER_HTTPS="1"
  fi
done

if [ -z "${PHP_INI_TIMEZONE}" ]; then
  PHP_INI_TIMEZONE="UTC"
fi

export FACTER_PHP_INI_TIMEZONE="${PHP_INI_TIMEZONE}"
