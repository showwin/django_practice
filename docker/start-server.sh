#!/bin/bash

cd /app
gunicorn django_practice.wsgi:application -b localhost:3000
