#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXMapPlots
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    "
id: TXMapPlots
inputs:
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: diagnostic_maps
  inputBinding:
    prefix: --diagnostic_maps
  label: diagnostic_maps
  type: File
- doc: Configuration file
  format: http://edamontology.org/format_3750
  id: config
  inputBinding:
    prefix: --config
  label: config
  type: File
label: TXMapPlots
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: depth_map
  label: depth_map
  outputBinding:
    glob: depth_map.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: ngal_lens_map
  label: ngal_lens_map
  outputBinding:
    glob: ngal_lens_map.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: g1_map
  label: g1_map
  outputBinding:
    glob: g1_map.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: g2_map
  label: g2_map
  outputBinding:
    glob: g2_map.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: flag_map
  label: flag_map
  outputBinding:
    glob: flag_map.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: mask_map
  label: mask_map
  outputBinding:
    glob: mask_map.png
  type: File
