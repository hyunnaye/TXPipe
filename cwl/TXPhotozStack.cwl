#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXPhotozStack
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    Naively stack photo-z PDFs in bins according to previous selections.\n\
  \n    "
id: TXPhotozStack
inputs:
- default: 5000
  doc: Some documentation about this parameter
  id: chunk_rows
  inputBinding:
    prefix: --chunk_rows=
    separate: false
  label: chunk_rows
  type: int
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: photoz_pdfs
  inputBinding:
    prefix: --photoz_pdfs
  label: photoz_pdfs
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
label: TXPhotozStack
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_3590
  id: photoz_stack
  label: photoz_stack
  outputBinding:
    glob: photoz_stack.hdf5
  type: File
