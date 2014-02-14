#!/bin/bash

docker build -rm -t docker-jekyll . && docker run -p 4000:4000 -v $PWD:/opt/jekyll -i -t docker-jekyll
