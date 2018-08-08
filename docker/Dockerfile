FROM lsstsqre/centos:7-stack-lsst_distrib-v15_0
MAINTAINER EiffL <francois.lanusse@gmail.com>

######## Install ceci, and MPI tools, this should be part of the base image
USER root
RUN mkdir /build

RUN cd /build && wget http://www.mpich.org/static/downloads/3.2/mpich-3.2.tar.gz \
  && tar xvzf mpich-3.2.tar.gz && cd /build/mpich-3.2 \
  && ./configure && make -j4 && make install && make clean && rm -rf /build/*

RUN cd /build && wget https://bitbucket.org/mpi4py/mpi4py/downloads/mpi4py-3.0.0.tar.gz \
  && tar xvzf mpi4py-3.0.0.tar.gz
RUN cd /build/mpi4py-3.0.0 && source /opt/lsst/software/stack/loadLSST.bash && setup lsst_distrib && \
    python setup.py build && python setup.py install  && rm -rf /build/*

ENV HDF5_MINOR_REL       hdf5-1.10.1
ENV HDF5_SRC_URL         http://www.hdfgroup.org/ftp/HDF5/releases

RUN cd /build/ && \
    wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.1/src/hdf5-1.10.1.tar.gz ; \
    tar -xvzf hdf5-1.10.1.tar.gz  --directory /usr/local/src                      ; \
    cd /usr/local/src/hdf5-1.10.1                                                  ; \
    ./configure --prefix=/usr/local/hdf5 --enable-parallel --enable-shared         ; \
    make                                                                           ; \
    make install                                                                   ; \
    for f in /usr/local/hdf5/bin/* ; do ln -s $f /usr/local/bin ; done  && rm -rf /build/*

RUN cd /build/ && source /opt/lsst/software/stack/loadLSST.bash && setup lsst_distrib && \
    git clone https://github.com/h5py/h5py.git                                     ; \
    cd h5py                                                                        ; \
    export CC=mpicc                                                                ; \
    export HDF5_DIR=/usr/local/hdf5                                                ; \
    python setup.py configure --mpi                                                ; \
    python setup.py build                                                          ; \
    python setup.py install && rm -rf /build

RUN /sbin/ldconfig

USER lsst

RUN source /opt/lsst/software/stack/loadLSST.bash && setup lsst_distrib \
    && pip install ruamel.yaml==0.13.13 cwlgen pyyaml descformats \
    && pip install parsl==0.5.2 \
    && pip install --no-deps git+https://github.com/LSSTDESC/ceci.git
########################################################################

# Install pipeline specific dependencies
RUN source /opt/lsst/software/stack/loadLSST.bash && setup lsst_distrib \
    && pip install fitsio TreeCorr

# Install pipeline package itself
RUN source /opt/lsst/software/stack/loadLSST.bash && setup lsst_distrib \
    && pip install git+https://github.com/EiffL/TXPipe

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["bash", "/entrypoint.sh"]
