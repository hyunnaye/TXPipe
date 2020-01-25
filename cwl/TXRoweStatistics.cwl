#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXRoweStatistics
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    People sometimes think that these statistics are called the Rho statistics,\n\
  \    because we usually use that letter for them.  Not so.  They are named after\n\
  \    the wonderfully incorrigible rogue Barney Rowe, now sadly lost to high finance,\n\
  \    who presented the first two of them in MNRAS 404, 350 (2010).\n    "
id: TXRoweStatistics
inputs:
- default: 0.5
  doc: Some documentation about this parameter
  id: min_sep
  inputBinding:
    prefix: --min_sep=
    separate: false
  label: min_sep
  type: float
- default: 250.0
  doc: Some documentation about this parameter
  id: max_sep
  inputBinding:
    prefix: --max_sep=
    separate: false
  label: max_sep
  type: float
- default: 20
  doc: Some documentation about this parameter
  id: nbins
  inputBinding:
    prefix: --nbins=
    separate: false
  label: nbins
  type: int
- default: 0.01
  doc: Some documentation about this parameter
  id: bin_slop
  inputBinding:
    prefix: --bin_slop=
    separate: false
  label: bin_slop
  type: float
- default: arcmin
  doc: Some documentation about this parameter
  id: sep_units
  inputBinding:
    prefix: --sep_units=
    separate: false
  label: sep_units
  type: string
- default: sigma
  doc: Some documentation about this parameter
  id: psf_size_units
  inputBinding:
    prefix: --psf_size_units=
    separate: false
  label: psf_size_units
  type: string
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
label: TXRoweStatistics
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: rowe134
  label: rowe134
  outputBinding:
    glob: rowe134.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: rowe25
  label: rowe25
  outputBinding:
    glob: rowe25.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_3590
  id: rowe_stats
  label: rowe_stats
  outputBinding:
    glob: rowe_stats.hdf5
  type: File
