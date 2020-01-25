#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXPhotozPlots
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    Make n(z) plots\n\n    "
id: TXPhotozPlots
inputs:
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: photoz_stack
  inputBinding:
    prefix: --photoz_stack
  label: photoz_stack
  type: File
- doc: Configuration file
  format: http://edamontology.org/format_3750
  id: config
  inputBinding:
    prefix: --config
  label: config
  type: File
label: TXPhotozPlots
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: nz_lens
  label: nz_lens
  outputBinding:
    glob: nz_lens.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: nz_source
  label: nz_source
  outputBinding:
    glob: nz_source.png
  type: File
