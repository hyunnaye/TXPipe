#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXTwoPointPlots
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    Make n(z) plots\n\n    "
id: TXTwoPointPlots
inputs:
- doc: Some documentation about the input
  format: http://edamontology.org/format_1915
  id: twopoint_data
  inputBinding:
    prefix: --twopoint_data
  label: twopoint_data
  type: File
- doc: Configuration file
  format: http://edamontology.org/format_3750
  id: config
  inputBinding:
    prefix: --config
  label: config
  type: File
label: TXTwoPointPlots
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: shear_xi
  label: shear_xi
  outputBinding:
    glob: shear_xi.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: shearDensity_xi
  label: shearDensity_xi
  outputBinding:
    glob: shearDensity_xi.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: density_xi
  label: density_xi
  outputBinding:
    glob: density_xi.png
  type: File
