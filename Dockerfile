FROM rocker/tensorflow-gpu:3.6.0
MAINTAINER "Trey Spiller" treyspiller@gmail.com

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    lbzip2 \
    libfftw3-dev \
    libgdal-dev \
    libgeos-dev \
    libgsl0-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libhdf4-alt-dev \
    libhdf5-dev \
    libjq-dev \
    liblwgeom-dev \
    libpq-dev \
    libproj-dev \
    libprotobuf-dev \
    libnetcdf-dev \
    libsqlite3-dev \
    libssl-dev \
    libudunits2-dev \
    netcdf-bin \
    postgis \
    protobuf-compiler \
    sqlite3 \
    tk-dev \
    unixodbc-dev \
    libmagick++-dev \
    binutils \
    gdal-bin \
    wget \
  && install2.r --error \
    RColorBrewer \
    RandomFields \
    RNetCDF \
    classInt \
    deldir \
    gstat \
    hdf5r \
    lidR \
    mapdata \
    maptools \
    mapview \
    ncdf4 \
    proj4 \
    raster \
    rgdal \
    rgeos \
    rlas \
    sf \
    sp \
    spacetime \
    spatstat \
    spatialreg \
    spdep \
    geoR \
    geosphere \
    magick \
    gdalUtils \
    ## from bioconductor
    && R -e "BiocManager::install('rhdf5')"

RUN cd opt \
  && wget http://bin.extensis.com/download/developer/MrSID_DSDK-9.5.1.4427-linux.x86-64.gcc48.tar.gz \
  && tar -xf MrSID_DSDK-9.5.1.4427-linux.x86-64.gcc48.tar.gz MrSID_DSDK-9.5.1.4427-linux.x86-64.gcc48/Raster_DSDK --strip-components=1 \
  && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/Raster_DSDK/lib \
  && ldconfig \
  && PATH=$PATH:/opt/Raster_DSDK/bin \
  && rm MrSID_DSDK-9.5.1.4427-linux.x86-64.gcc48.tar.gz
