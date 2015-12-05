#!/usr/bin/env bash

if [ -n "${MYSQL_HOST}" ]; then
  export FACTER_MYSQL_HOST="${MYSQL_HOST}"

  if [ -z "${MYSQL_PORT}" ]; then
    MYSQL_PORT="3306"
  fi

  export FACTER_MYSQL_PORT="${MYSQL_PORT}"
else
  MYSQL_PORT="$(echo "${MYSQL_PORT}" | sed 's/tcp:\/\///')"

  export FACTER_MYSQL_HOST="$(echo "${MYSQL_PORT}" | cut -d ":" -f1)"
  export FACTER_MYSQL_PORT="$(echo "${MYSQL_PORT}" | cut -d ":" -f2)"
fi

if [ -z "${MYSQL_USERNAME}" ]; then
  MYSQL_USERNAME="container"
fi

export FACTER_MYSQL_USERNAME="${MYSQL_USERNAME}"

if [ -z "${MYSQL_PASSWORD}" ]; then
  MYSQL_PASSWORD="container"
fi

export FACTER_MYSQL_PASSWORD="${MYSQL_PASSWORD}"

if [ -n "${ZABBIX_SERVER_HOST}" ]; then
  export FACTER_ZABBIX_SERVER_HOST="${ZABBIX_SERVER_HOST}"

  if [ -z "${ZABBIX_SERVER_PORT}" ]; then
    ZABBIX_SERVER_PORT="10051"
  fi

  export FACTER_ZABBIX_SERVER_PORT="${ZABBIX_SERVER_PORT}"
else
  ZABBIX_SERVER_PORT="$(echo "${ZABBIX_SERVER_PORT}" | sed 's/tcp:\/\///')"

  export FACTER_ZABBIX_SERVER_HOST="$(echo "${ZABBIX_SERVER_PORT}" | cut -d ":" -f1)"
  export FACTER_ZABBIX_SERVER_PORT="$(echo "${ZABBIX_SERVER_PORT}" | cut -d ":" -f2)"
fi

if [ -z "${SERVER_NAME}" ]; then
  SERVER_NAME="localhost"
fi

export FACTER_SERVER_NAME="${SERVER_NAME}"

if [ -z "${TIMEZONE}" ]; then
  TIMEZONE="Etc/UTC"
fi

export FACTER_TIMEZONE="${TIMEZONE}"

if [ -z "${PHP_INI_MAX_EXECUTION_TIME}" ]; then
  PHP_INI_MAX_EXECUTION_TIME="900"
fi

export FACTER_PHP_INI_MAX_EXECUTION_TIME="${PHP_INI_MAX_EXECUTION_TIME}"
export FACTER_TIMEOUT="${PHP_INI_MAX_EXECUTION_TIME}"

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

export FACTER_HTTP_BASIC_AUTH="${HTTP_BASIC_AUTH}"

if [ -z "${HTTP_BASIC_AUTH_USERNAME}" ]; then
  HTTP_BASIC_AUTH_USERNAME="container"
fi

export FACTER_HTTP_BASIC_AUTH_USERNAME="${HTTP_BASIC_AUTH_USERNAME}"

export FACTER_HTTP_BASIC_AUTH_PASSWORD="${HTTP_BASIC_AUTH_PASSWORD}"

if [ -z "${OPENVPN}" ]; then
  OPENVPN="Off"
fi

if [ "${OPENVPN}" == "True" ]; then
  OPENVPN="On"
fi

export FACTER_OPENVPN="${OPENVPN}"

if [ -z "${OPENVPN_DEVICE}" ]; then
  OPENVPN_DEVICE="TAP"
fi

export FACTER_OPENVPN_DEVICE="${OPENVPN_DEVICE}"

export FACTER_OPENVPN_HOST="${OPENVPN_HOST}"

if [ -z "${OPENVPN_PORT}" ]; then
  OPENVPN_PORT="1194"
fi

export FACTER_OPENVPN_PORT="${OPENVPN_PORT}"

export FACTER_OPENVPN_USERNAME="${OPENVPN_USERNAME}"
export FACTER_OPENVPN_PASSWORD="${OPENVPN_PASSWORD}"

export FACTER_OPENVPN_CA_CERTIFICATE="${OPENVPN_CA_CERTIFICATE}"
