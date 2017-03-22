#!/bin/bash

# TODO cheating for now with host networking
docker run -it --rm -w /code -v  $(pwd):/code --entrypoint node --net host node:7.7.3 greeter_client.js

