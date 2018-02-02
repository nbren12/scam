#!/bin/sh
docker run --privileged -v $(pwd)/run/era40:/rundir  -v $(pwd)/inputdata:/inputdata -it nbren12:cam $1
