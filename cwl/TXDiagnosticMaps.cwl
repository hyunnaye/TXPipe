#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXDiagnosticMaps
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    For now, this Pipeline Stage computes a depth map using the DR1 method,\n\
  \    which takes the mean magnitude of objects close to 5-sigma S/N.\n\n    In the\
  \ future we will add the calculation of other diagnostic maps\n    like airmass\
  \ for use in systematics tests and covariance mode projection.\n\n    DM may in\
  \ the future provide tools we can use in place of the methods\n    used here, but\
  \ not on the DC2 timescale.\n\n\n    "
id: TXDiagnosticMaps
inputs:
- default: healpix
  doc: Some documentation about this parameter
  id: pixelization
  inputBinding:
    prefix: --pixelization=
    separate: false
  label: pixelization
  type: string
- default: 0
  doc: Some documentation about this parameter
  id: nside
  inputBinding:
    prefix: --nside=
    separate: false
  label: nside
  type: int
- doc: Some documentation about this parameter
  id: snr_threshold
  inputBinding:
    prefix: --snr_threshold=
    separate: false
  label: snr_threshold
  type: float
- default: 1.0
  doc: Some documentation about this parameter
  id: snr_delta
  inputBinding:
    prefix: --snr_delta=
    separate: false
  label: snr_delta
  type: float
- default: 100000
  doc: Some documentation about this parameter
  id: chunk_rows
  inputBinding:
    prefix: --chunk_rows=
    separate: false
  label: chunk_rows
  type: int
- default: true
  doc: Some documentation about this parameter
  id: sparse
  inputBinding:
    prefix: --sparse
  label: sparse
  type: boolean
- default: .nan
  doc: Some documentation about this parameter
  id: ra_cent
  inputBinding:
    prefix: --ra_cent=
    separate: false
  label: ra_cent
  type: float
- default: .nan
  doc: Some documentation about this parameter
  id: dec_cent
  inputBinding:
    prefix: --dec_cent=
    separate: false
  label: dec_cent
  type: float
- default: -1
  doc: Some documentation about this parameter
  id: npix_x
  inputBinding:
    prefix: --npix_x=
    separate: false
  label: npix_x
  type: int
- default: -1
  doc: Some documentation about this parameter
  id: npix_y
  inputBinding:
    prefix: --npix_y=
    separate: false
  label: npix_y
  type: int
- default: .nan
  doc: Some documentation about this parameter
  id: pixel_size
  inputBinding:
    prefix: --pixel_size=
    separate: false
  label: pixel_size
  type: float
- default: i
  doc: Some documentation about this parameter
  id: depth_band
  inputBinding:
    prefix: --depth_band=
    separate: false
  label: depth_band
  type: string
- default: false
  doc: Some documentation about this parameter
  id: true_shear
  inputBinding:
    prefix: --true_shear
  label: true_shear
  type: boolean
- default: 8
  doc: Some documentation about this parameter
  id: flag_exponent_max
  inputBinding:
    prefix: --flag_exponent_max=
    separate: false
  label: flag_exponent_max
  type: int
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: photometry_catalog
  inputBinding:
    prefix: --photometry_catalog
  label: photometry_catalog
  type: File
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: shear_catalog
  inputBinding:
    prefix: --shear_catalog
  label: shear_catalog
  type: File
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: tomography_catalog
  inputBinding:
    prefix: --tomography_catalog
  label: tomography_catalog
  type: File
- doc: Configuration file
  format: http://edamontology.org/format_3750
  id: config
  inputBinding:
    prefix: --config
  label: config
  type: File
label: TXDiagnosticMaps
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_3590
  id: diagnostic_maps
  label: diagnostic_maps
  outputBinding:
    glob: diagnostic_maps.hdf5
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_3590
  id: tracer_metdata
  label: tracer_metdata
  outputBinding:
    glob: tracer_metdata.hdf5
  type: File
