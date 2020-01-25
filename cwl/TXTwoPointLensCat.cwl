#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXTwoPointLensCat
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    This subclass of the standard TXTwoPoint takes its\n    lens sample from\
  \ an external source instead of using\n    the photometric sample.\n    "
id: TXTwoPointLensCat
inputs:
- default:
  - 0
  - 1
  - 2
  doc: Some documentation about this parameter
  id: calcs
  inputBinding:
    itemSeparator: ','
    prefix: --calcs=
    separate: false
  label: calcs
  type:
    items: int
    type: array
- default: 2.5
  doc: Some documentation about this parameter
  id: min_sep
  inputBinding:
    prefix: --min_sep=
    separate: false
  label: min_sep
  type: float
- default: 250
  doc: Some documentation about this parameter
  id: max_sep
  inputBinding:
    prefix: --max_sep=
    separate: false
  label: max_sep
  type: int
- default: 20
  doc: Some documentation about this parameter
  id: nbins
  inputBinding:
    prefix: --nbins=
    separate: false
  label: nbins
  type: int
- default: 0.1
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
- default: true
  doc: Some documentation about this parameter
  id: flip_g2
  inputBinding:
    prefix: --flip_g2
  label: flip_g2
  type: boolean
- default: 20
  doc: Some documentation about this parameter
  id: cores_per_task
  inputBinding:
    prefix: --cores_per_task=
    separate: false
  label: cores_per_task
  type: int
- default: 1
  doc: Some documentation about this parameter
  id: verbose
  inputBinding:
    prefix: --verbose=
    separate: false
  label: verbose
  type: int
- default:
  - -1
  doc: Some documentation about this parameter
  id: source_bins
  inputBinding:
    itemSeparator: ','
    prefix: --source_bins=
    separate: false
  label: source_bins
  type:
    items: int
    type: array
- default:
  - -1
  doc: Some documentation about this parameter
  id: lens_bins
  inputBinding:
    itemSeparator: ','
    prefix: --lens_bins=
    separate: false
  label: lens_bins
  type:
    items: int
    type: array
- default: 1.0
  doc: Some documentation about this parameter
  id: reduce_randoms_size
  inputBinding:
    prefix: --reduce_randoms_size=
    separate: false
  label: reduce_randoms_size
  type: float
- default: true
  doc: Some documentation about this parameter
  id: do_shear_shear
  inputBinding:
    prefix: --do_shear_shear
  label: do_shear_shear
  type: boolean
- default: true
  doc: Some documentation about this parameter
  id: do_shear_pos
  inputBinding:
    prefix: --do_shear_pos
  label: do_shear_pos
  type: boolean
- default: true
  doc: Some documentation about this parameter
  id: do_pos_pos
  inputBinding:
    prefix: --do_pos_pos
  label: do_pos_pos
  type: boolean
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: shear_catalog
  inputBinding:
    prefix: --shear_catalog
  label: shear_catalog
  type: File
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: tomography_catalog
  inputBinding:
    prefix: --tomography_catalog
  label: tomography_catalog
  type: File
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: photoz_stack
  inputBinding:
    prefix: --photoz_stack
  label: photoz_stack
  type: File
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: random_cats
  inputBinding:
    prefix: --random_cats
  label: random_cats
  type: File
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: lens_catalog
  inputBinding:
    prefix: --lens_catalog
  label: lens_catalog
  type: File
- doc: Configuration file
  format: http://edamontology.org/format_3750
  id: config
  inputBinding:
    prefix: --config
  label: config
  type: File
label: TXTwoPointLensCat
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: twopoint_data
  label: twopoint_data
  outputBinding:
    glob: twopoint_data.sacc
  type: File
