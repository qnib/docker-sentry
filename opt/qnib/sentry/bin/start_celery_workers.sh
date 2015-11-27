#!/bin/sh

sleep 10

su -c 'sentry celery worker -B' user
