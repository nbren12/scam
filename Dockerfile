FROM ubuntu

RUN apt-get update && apt-get install -y \
  build-essential \
  libnetcdf-dev \
  libnetcdff-dev \
  gdb git


RUN apt-get install -y gfortran

ENV INC_NETCDF /usr/include
ENV LIB_NETCDF /usr/lib/x86_64-linux-gnu
ENV CAM_ROOT /cesm
ENV camcfg /cesm/models/atm/cam/bld

RUN git clone https://github.com/earthers/cesm-1_2_2 /cesm

RUN mkdir -p /bld
RUN cd /bld && \
  $camcfg/configure -scam  -nlev 30 -fc gfortran \
       -nospmd -nospm -dyn eul -debug \
       -res 64x128 -fflags '-fbacktrace -fcheck=all' \
       -ocn aquaplanet # -debug

RUN cd /bld && make -j 2 > compile_output 2>&1


ENV CSMDATA /inputdata


WORKDIR /rundir
CMD /bld/cam | tee run_output 
