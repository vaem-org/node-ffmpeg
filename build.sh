#!/bin/bash

if [ ! -e bin ]; then
    mkdir bin
fi

docker build -t vaem/ffmpeg-build -f Dockerfile.build .
docker run --rm -it -v "$PWD:/mount" vaem/ffmpeg-build cp /usr/bin/{ffmpeg,ffprobe} /mount/bin
docker build -t vaem/node-ffmpeg -f Dockerfile .