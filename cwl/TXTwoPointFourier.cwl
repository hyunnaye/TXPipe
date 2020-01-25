#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXTwoPointFourier
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "This Pipeline Stage computes all auto- and cross-correlations\n    for a list\
  \ of tomographic bins, including all galaxy-galaxy,\n    galaxy-shear and shear-shear\
  \ power spectra. Sources and lenses\n    both come from the same shear_catalog and\
  \ tomography_catalog objects.\n\n    The power spectra are computed after deprojecting\
  \ a number of\n    systematic-dominated modes, represented as input maps.\n\n  \
  \  In the future we will want to include the following generalizations:\n     -\
  \ TODO: specify which cross-correlations in particular to include\n            \
  \ (e.g. which bin pairs and which source/lens combinations).\n     - TODO: include\
  \ flags for rejected objects. Is this included in\n             the tomography_catalog?\n\
  \     - TODO: ell-binning is currently static.\n    "
id: TXTwoPointFourier
inputs:
- default: 0.0
  doc: Some documentation about this parameter
  id: mask_threshold
  inputBinding:
    prefix: --mask_threshold=
    separate: false
  label: mask_threshold
  type: float
- default: 0
  doc: Some documentation about this parameter
  id: bandwidth
  inputBinding:
    prefix: --bandwidth=
    separate: false
  label: bandwidth
  type: int
- default: 3.0
  doc: Some documentation about this parameter
  id: apodization_size
  inputBinding:
    prefix: --apodization_size=
    separate: false
  label: apodization_size
  type: float
- default: C1
  doc: Some documentation about this parameter
  id: apodization_type
  inputBinding:
    prefix: --apodization_type=
    separate: false
  label: apodization_type
  type: string
- default: false
  doc: Some documentation about this parameter
  id: flip_g2
  inputBinding:
    prefix: --flip_g2
  label: flip_g2
  type: boolean
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: photoz_stack
  inputBinding:
    prefix: --photoz_stack
  label: photoz_stack
  type: File
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: diagnostic_maps
  inputBinding:
    prefix: --diagnostic_maps
  label: diagnostic_maps
  type: File
- doc: Some documentation about the input
  format: http://edamontology.org/format_3750
  id: fiducial_cosmology
  inputBinding:
    prefix: --fiducial_cosmology
  label: fiducial_cosmology
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
label: TXTwoPointFourier
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: twopoint_data_fourier
  label: twopoint_data_fourier
  outputBinding:
    glob: twopoint_data_fourier.sacc
  type: File
