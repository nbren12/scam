#!/bin/sh
docker run --privileged -v $(pwd)/run:/rundir  -v $(pwd)/inputdata:/inputdata -it nbren12:cam $1
