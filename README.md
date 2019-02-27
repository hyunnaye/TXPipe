DESC 3x2pt Pipeline Stages
--------------------------

This is a collection of modules for the DESC 3x2pt pipeline.
We will build up the modules needed for the analysis as shown in the Pipelines repository.

It builds on the ceci repository for the infrastructure.

Goals
-----

- Test using parsl for some of our larger more complex analyses.
- Build and test a prototype pipeline infrastructure.
- Build and run prototype.
- Perform and publish a DC2 3x2pt analysis.


Installation on your own machine
--------------------------------

Requires python3, numpy, scipy, pyyaml, fitsio, h5py (which in turn needs HDF5), ceci, and parsl.

HDF5 is slow to install - it is available in Homebrew.

To install using pip:
```bash
pip scipy pyyaml ceci
pip install fitsio h5py 
```

Installation using Docker
-------------------------

In Docker, from the main directory, this will get you the newest version of the code:

```bash
docker pull joezuntz/txpipe
docker run --rm -it -v$PWD:/opt/txpipe joezuntz/txpipe
```

Installation on Cori
--------------------

These dependencies are all already prepared on cori - use this environment:

```bash

# On the login nodes:
source /global/projecta/projectdirs/lsst/groups/WL/users/zuntz/setup-cori-nompi

# When submitting jobs:
source /global/projecta/projectdirs/lsst/groups/WL/users/zuntz/setup-cori

```

Input test data
---------------

You can get input test data like this:

```bash

mkdir -p inputs/1e5
cd inputs/1e5
curl -O https://portal.nersc.gov/project/lsst/WeakLensing/mock_shear_catalog.fits
curl -O https://portal.nersc.gov/project/lsst/WeakLensing/mock_photometry_catalog.hdf
curl -O https://portal.nersc.gov/project/lsst/WeakLensing/photoz_trained_model.npy
cd ../..
```


Running the pipeline
--------------------

Make sure that ceci is installed.
Then you can run:

```bash
export DATA=inputs/1e5
ceci test/test-fourier.yml
```

to run the implemented stages


Implementation
--------------

Each pipeline stage is implemented as a python class inheriting from ceci.Pipeline stage.  These subclasses should:

- have a "name" attribute string.
- have class attributes "inputs" and "outputs", each of which is a list of tuple pairs with a string tag and a FileType class.
- define a "config_options" dictionary of options it expects to find in its section of the main config file, with the value as a default for the option or a type if there is no default.
- implement a "run" method doing the actual work of the class.  Your class should then call the methods described below to interact with the pipeline


Some implementation notes:

- Our catalogs will be large. Wherever possible stages should operate on chunks of their input data at once. ceci has some methods for this (see README)
- Pipeline stages shouldn't copy existing columns to new data.
- No ASCII output allowed!
- Python 3.6
- We will do code review
- One file per box (?)

Pipeline Stage Methods
----------------------

The pipeline stages can use these methods to interact with the pipeline:

Basic tools to find the file path:

- self.get_input(tag)
- self.get_output(tag)

Get base class to find and open the file for you

- self.open_input(tag, **kwargs)
- self.open_output(tag, **kwargs)


Look for a section in a yaml input file tagged "config"
and read it.  If the config_options class variable exists in the class
then it checks those options are set or uses any supplied defaults:

- self.config['name_of_option']

Parallelization tools - MPI attributes:

- self.rank
- self.size
- self.comm

(Parallel) IO tools - reading data in chunks, splitting up 
according to MPI rank:

- self.iterate_fits(tag, hdunum, cols, chunk_rows)
- self.iterate_hdf(tag, group_name, cols, chunk_rows)








Volunteers
----------

- Chihway C & Emily PL - TXTwoPointReal (WLPipe porting & testing)
- David A - TXSysMapMaker
- Anze S - SACC
- Tim E - TXCov
- Alex M - TXSourceSummarizer
- Antonino T & David A - TXTwoPointPower
