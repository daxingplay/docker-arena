#!/bin/sh

config_file=/srv/config/index.json

if [ -f $config_file ]; then
  cp -f $config_file /srv/index.json
fi

node /srv/index.js
