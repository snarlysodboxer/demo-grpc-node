#!/bin/bash

docker run -it --rm -w /code -v  $(pwd):/code --entrypoint npm node:7.7.3 install
# TODO cheating for now with host networking
docker run -t --rm -w /code -v  $(pwd):/code --entrypoint node --net host node:7.7.3 greeter_server.js

