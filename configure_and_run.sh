#!/bin/sh

$camcfg/build-namelist -namelist "&atm iopfile='/inputdata/atm/cam/scam/iop/bomex.nc'
nhtfrq=-1   single_column=.true. scmlat=0.0 scmlon=0.0  /" -config /bld/config_cache.xml
