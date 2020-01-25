#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXMetacalGCRInput
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    This stage simulates metacal data and metacalibrated\n    photometry measurements,\
  \ starting from a cosmology catalogs\n    of the kind used as an input to DC2 image\
  \ and obs-catalog simulations.\n\n    This is mainly useful for testing infrastructure\
  \ in advance\n    of the DC2 catalogs being available, but might also be handy\n\
  \    for starting from a purer simulation.\n    "
id: TXMetacalGCRInput
inputs:
- doc: Some documentation about this parameter
  id: cat_name
  inputBinding:
    prefix: --cat_name=
    separate: false
  label: cat_name
  type: string
- doc: Configuration file
  format: http://edamontology.org/format_3750
  id: config
  inputBinding:
    prefix: --config
  label: config
  type: File
label: TXMetacalGCRInput
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_3590
  id: shear_catalog
  label: shear_catalog
  outputBinding:
    glob: shear_catalog.hdf5
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_3590
  id: photometry_catalog
  label: photometry_catalog
  outputBinding:
    glob: photometry_catalog.hdf5
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_3590
  id: star_catalog
  label: star_catalog
  outputBinding:
    glob: star_catalog.hdf5
  type: File
