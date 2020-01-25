#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXExposureInfo
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    "
id: TXExposureInfo
inputs:
- default: 1.2p
  doc: Some documentation about this parameter
  id: dc2_name
  inputBinding:
    prefix: --dc2_name=
    separate: false
  label: dc2_name
  type: string
- default: /global/projecta/projectdirs/lsst/groups/SSim/DC2/minion_1016_desc_dithered_v4.db
  doc: Some documentation about this parameter
  id: opsim_db
  inputBinding:
    prefix: --opsim_db=
    separate: false
  label: opsim_db
  type: string
- default: 54
  doc: Some documentation about this parameter
  id: propId
  inputBinding:
    prefix: --propId=
    separate: false
  label: propId
  type: int
- doc: Configuration file
  format: http://edamontology.org/format_3750
  id: config
  inputBinding:
    prefix: --config
  label: config
  type: File
label: TXExposureInfo
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_3590
  id: exposures
  label: exposures
  outputBinding:
    glob: exposures.hdf5
  type: File
