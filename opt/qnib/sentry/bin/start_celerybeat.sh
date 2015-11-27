#!/bin/sh

sleep 5

su -c 'sentry celerybeat' user
