#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: PZPDFMLZ
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n\n\n    "
id: PZPDFMLZ
inputs:
- doc: Some documentation about this parameter
  id: zmax
  inputBinding:
    prefix: --zmax=
    separate: false
  label: zmax
  type: float
- doc: Some documentation about this parameter
  id: nz
  inputBinding:
    prefix: --nz=
    separate: false
  label: nz
  type: int
- default: 10000
  doc: Some documentation about this parameter
  id: chunk_rows
  inputBinding:
    prefix: --chunk_rows=
    separate: false
  label: chunk_rows
  type: int
- default: ugrizy
  doc: Some documentation about this parameter
  id: bands
  inputBinding:
    prefix: --bands=
    separate: false
  label: bands
  type: string
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: photometry_catalog
  inputBinding:
    prefix: --photometry_catalog
  label: photometry_catalog
  type: File
- doc: Some documentation about the input
  format: http://edamontology.org/format_1915
  id: photoz_trained_model
  inputBinding:
    prefix: --photoz_trained_model
  label: photoz_trained_model
  type: File
- doc: Configuration file
  format: http://edamontology.org/format_3750
  id: config
  inputBinding:
    prefix: --config
  label: config
  type: File
label: PZPDFMLZ
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_3590
  id: photoz_pdfs
  label: photoz_pdfs
  outputBinding:
    glob: photoz_pdfs.hdf5
  type: File
