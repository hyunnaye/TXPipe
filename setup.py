#!/usr/bin/env python
from setuptools import setup

setup(name="txpipe",
    description="Tools for 3x2pt analysis.",
    author="LSST DESC",
    url="https://github.com/LSSTDESC/TXPipe",
    packages=['txpipe', 'txpipe.depth', 'txpipe.randoms', 'txpipe.utils'],
    provides=['txpipe']
    )
