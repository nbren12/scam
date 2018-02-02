#!/bin/sh
cp Dockerfile build
cd build
docker build .
