#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXBrighterFatterPlot
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
id: TXBrighterFatterPlot
inputs:
- default: r
  doc: Some documentation about this parameter
  id: band
  inputBinding:
    prefix: --band=
    separate: false
  label: band
  type: string
- default: 20
  doc: Some documentation about this parameter
  id: nbin
  inputBinding:
    prefix: --nbin=
    separate: false
  label: nbin
  type: int
- default: 18.5
  doc: Some documentation about this parameter
  id: mmin
  inputBinding:
    prefix: --mmin=
    separate: false
  label: mmin
  type: float
- default: 23.5
  doc: Some documentation about this parameter
  id: mmax
  inputBinding:
    prefix: --mmax=
    separate: false
  label: mmax
  type: float
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: star_catalog
  inputBinding:
    prefix: --star_catalog
  label: star_catalog
  type: File
- doc: Configuration file
  format: http://edamontology.org/format_3750
  id: config
  inputBinding:
    prefix: --config
  label: config
  type: File
label: TXBrighterFatterPlot
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: brighter_fatter_plot
  label: brighter_fatter_plot
  outputBinding:
    glob: brighter_fatter_plot.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_3590
  id: brighter_fatter_data
  label: brighter_fatter_data
  outputBinding:
    glob: brighter_fatter_data.hdf5
  type: File
