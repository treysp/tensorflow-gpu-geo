# treysp/tensorflow-gpu-geo

Docker-based Geospatial toolkit for R, built on versioned Rocker images built with support
for Tensorflow GPU operations. 

This image extends the experimental [`rocker-ml` stack](https://github.com/rocker-org/ml) with geospatial-related tools, particularly those that can be difficult or slow to add on-the-fly.  As such, this image includes RStudio and the tidyverse packages. It also includes the [`magick` package](https://github.com/ropensci/magick) to enable fast image processing/manipulation operations.

The full dependency tree for this image is:    
    `debian:stretch` -->    
    [`rocker/r-ver:3.6.0`](https://github.com/rocker-org/rocker-versioned/tree/master/r-ver) -->    
    [`rocker/rstudio:3.6.0`](https://github.com/rocker-org/rocker-versioned/tree/master/rstudio) -->    
    [`rocker/tidyverse:3.6.0`](https://github.com/rocker-org/rocker-versioned/tree/master/tidyverse) -->    
    [`rocker/cuda:3.6.0`](https://github.com/rocker-org/ml/tree/master/cuda/base) -->    
    [`rocker/tensorflow:3.6.0`](https://github.com/rocker-org/ml/tree/master/tensorflow/gpu) -->    
    [`this image`](./Dockerfile)    

## Packages

### Tensorflow
The tensorflow configuration uses a Python 3 virtual environment (`venv`) that R acesses via the [`reticulate`](https://rstudio.github.io/reticulate/), [`tensorflow`](https://tensorflow.rstudio.com/), and [`keras`](https://keras.rstudio.com/) packages. 

### Geospatial
The packages included in this image are not meant to provide a kitchen-sink of all geo-spatially related R packages, see the [Spatial Task View](https://cran.r-project.org/web/views/Spatial.html) and [SpatioTemporal Task View](https://cran.r-project.org/web/views/SpatioTemporal.html) on CRAN.  This image seeks to provide a more opinionated collection of packages, prioritizing those packages that can be slow or tricky to install due to compiled code and external dependencies, and with an emphasis on more general-purpose libraries and classes.

Please note that many additional geospatial (and other) packages are pulled in as dependencies of this list and thus can also be found on the image.

Package       | Maintainer| Description 
--------------|-----------|----------------------------------
RColorBrewer  |           | Colors for maps and other plots
RandomFields  |Schlather  | Methods for the inference on and the simulation of Gaussian fields, and simulation of extreme value random fields.
RNetCDF       | Woods     | Bindings to C API NetCDF library, with udunits 
classInt      | Bivand    | Selected commonly used methods for choosing univariate class intervals for mapping or other graphics purposes.
deldir        | Turner    | Delaunay Triangulation and Dirichlet (Voronoi) Tessellation 
gstat         | Pebesma   | Spatial and Spatio-Temporal Geostatistical Modelling, Prediction and Simulation
hdf5r         | Hoefling  | Modern bindings to HF5 C API (replaces hf package)
lidR          | Roussel   | Airborne LiDAR (Light Detection and Ranging) interface for data manipulation and visualization. Read/write 'las' and 'laz' file
mapdata       | Deckmyn   | Extra map data for the `maps` package (originally from S)
maptools      | Bivand    | Set of tools for manipulating and reading geographic data, in particular ESRI Shapefiles.  (See `rgdal` and `sf` for more comprehensive I/O)
mapview       | Appelhans | sf-compatible interactive map viewer, extends leaflet
ncdf4         | Pierce    | `raster`-package compatible netcdf bindings
proj4         | Urbanek   | A simple interface to lat/long projection and datum transformation.  See `sf` implementation as well. 
raster        | Hijmans   | Reading, writing, manipulating, analyzing and modeling of gridded spatial data.
rgdal         | Bivand    | Interface to GDAL, I/O formats. See `sf` for more recent implementation
rgeos         | Bivand    | Interface to GEOS (geometry operations). See `sf` for more recent implementation
sf            | Pebesma   | Simple-features oriented replacement for sp, rgdal, rgeos, and proj4 libraries, includes dplyr-style methods.
sp            | Pebesma   | Original & widely used spatial object class
spacetime     | Pebesma   | Classes and Methods for Spatio-Temporal Data
spatstat      | Baddeley  | Large spatial statistics package: Spatial Point Pattern Analysis, Model-Fitting, Simulation, Tests
spatialreg    | Bivand    | Spatial Regression Analysis: Spatatial Autregressive Models (formerly in spdep)
spdep         | Bivand    | Spatial Dependence: Weighting Schemes, Statistics and Models
tmap          | Tennekes  | Thematic, layer-based maps (sf and sp compatible)
geoR          | Ribeiro   | Geostatistical analysis including traditional, likelihood-based and Bayesian methods.
geosphere     | Hijmans   | Spherical trigonometry for geographic applications. That is, compute distances and related measures for angular (longitude/latitude) locations. 
magick        | Ooms      | Bindings to 'ImageMagick': the most comprehensive open-source image processing library available.
gdalUtils     | Greenberg | Wrappers for the Geospatial Data Abstraction Library (GDAL) Utilities.

### GDAL
The `sf` and `rgdal` packages use a number of features from the GDAL utility, but the GDAL version they leverage is not compiled with write support for some file drivers. 

This image adds the Debian package GDAL binaries that were compiled with support for writing the JPEG2000 (.jp2) image format. Its capabilities can be accessed with the `gdalUtils` R package.
