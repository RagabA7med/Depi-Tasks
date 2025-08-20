#!/bin/bash
echo "Welcome to my Docker container!"
echo "App version is $APP_VERSION"
exec "$@"
