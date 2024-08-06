#!/bin/bash
docker rm -f website &2>/dev/null || true
docker images --format '{{.Repository}}:{{.Tag}}' | grep 'imhnk/crawler-website-lab' | xargs -r docker rmi -f
docker run --net crawler -d --name website -p 3100:80 $1
