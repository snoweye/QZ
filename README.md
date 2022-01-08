# QZ

* **License:** [![License](http://img.shields.io/badge/license-MPL%202-orange.svg?style=flat)](https://www.mozilla.org/MPL/2.0/)
* **Download:** [![Download](http://cranlogs.r-pkg.org/badges/QZ)](https://cran.r-project.org/package=QZ)
* **Status:** [![Build Status](https://gitlab.com/snoweye/QZ/badges/master/pipeline.svg)](https://gitlab.com/snoweye/QZ/-/commits/master) [![Appveyor Build status](https://ci.appveyor.com/api/projects/status/32r7s2skrgm9ubva?svg=true)](https://ci.appveyor.com/project/snoweye/QZ)
* **Author:** Wei-Chen Chen

QZ is an R package providing QZ factorization for generalized eigenvalues and eigenvectors via QZ decomposition (generalized Schur decomposition). Typically, the decomposition needs an N-by-N non-symmetric matrix A or paired matrices (A,B) with eigenvalues reordering mechanism. The decomposition functions are mainly based Fortran subroutines in complex\*16 and double precision of LAPACK library (version 3.4.2. or later).  

## QZ requires

* R version 3.6.0 or higher.
* For installing QZ, see ``INSTALL`` file for details.
* More information about QZ can be found in the QZ vignette at ``QZ/inst/doc/QZ-guide.pdf``.
