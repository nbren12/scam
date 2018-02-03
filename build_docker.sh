#!/bin/sh
cp Dockerfile build
cd build
docker build -t nbren12:cam .
