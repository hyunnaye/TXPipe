#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXGCRMockMetacal
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    Use real photometry from the DRP (output of DM stack) in merged form,\n\
  \    but fake metacal responses for the magnitudes.\n\n    TODO: Shapes!\n    "
id: TXGCRMockMetacal
inputs:
- default: dc2_coadd_run1.1p
  doc: Some documentation about this parameter
  id: cat_name
  inputBinding:
    prefix: --cat_name=
    separate: false
  label: cat_name
  type: string
- default: 4.0
  doc: Some documentation about this parameter
  id: snr_limit
  inputBinding:
    prefix: --snr_limit=
    separate: false
  label: snr_limit
  type: float
- default: 99999999999999
  doc: Some documentation about this parameter
  id: max_size
  inputBinding:
    prefix: --max_size=
    separate: false
  label: max_size
  type: int
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: response_model
  inputBinding:
    prefix: --response_model
  label: response_model
  type: File
- doc: Configuration file
  format: http://edamontology.org/format_3750
  id: config
  inputBinding:
    prefix: --config
  label: config
  type: File
label: TXGCRMockMetacal
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_3590
  id: photometry_catalog
  label: photometry_catalog
  outputBinding:
    glob: photometry_catalog.hdf5
  type: File
