#!/bin/bash

if [ "X${SENTRY_URL_PREFIX}" != "X" ];then
    echo "> Set SENTRY_URL_PREFIX to '${SENTRY_URL_PREFIX}'"
	sed -i'' -e "s#SENTRY_URL_PREFIX =.*#SENTRY_URL_PREFIX = '${SENTRY_URL_PREFIX}'#" /home/user/.sentry/sentry.conf.py
fi
su -c 'sentry start' user
