#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXSelector
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    This pipeline stage selects objects to be used\n    as the source sample\
  \ for the shear-shear and\n    shear-position calibrations.  It applies some\n \
  \   general cuts based on the flags that metacal\n    gives for the objects, and\
  \ size and S/N cuts\n    based on the configuration file.\n\n    It also splits\
  \ those objects into tomographic\n    bins according to the choice the user makes\n\
  \    in the input file, from the information in the\n    photo-z PDF file.\n\n \
  \   Once these selections are made it constructs\n    the quantities needed to calibrate\
  \ each bin -\n    this consists of two shear response quantities.\n    "
id: TXSelector
inputs:
- default: false
  doc: Some documentation about this parameter
  id: input_pz
  inputBinding:
    prefix: --input_pz
  label: input_pz
  type: boolean
- default: riz
  doc: Some documentation about this parameter
  id: bands
  inputBinding:
    prefix: --bands=
    separate: false
  label: bands
  type: string
- default: false
  doc: Some documentation about this parameter
  id: verbose
  inputBinding:
    prefix: --verbose
  label: verbose
  type: boolean
- doc: Some documentation about this parameter
  id: T_cut
  inputBinding:
    prefix: --T_cut=
    separate: false
  label: T_cut
  type: float
- doc: Some documentation about this parameter
  id: s2n_cut
  inputBinding:
    prefix: --s2n_cut=
    separate: false
  label: s2n_cut
  type: float
- doc: Some documentation about this parameter
  id: delta_gamma
  inputBinding:
    prefix: --delta_gamma=
    separate: false
  label: delta_gamma
  type: float
- default: 10000
  doc: Some documentation about this parameter
  id: chunk_rows
  inputBinding:
    prefix: --chunk_rows=
    separate: false
  label: chunk_rows
  type: int
- doc: Some documentation about this parameter
  id: zbin_edges
  inputBinding:
    itemSeparator: ','
    prefix: --zbin_edges=
    separate: false
  label: zbin_edges
  type:
    items: float
    type: array
- default: 0.2
  doc: Some documentation about this parameter
  id: cperp_cut
  inputBinding:
    prefix: --cperp_cut=
    separate: false
  label: cperp_cut
  type: float
- default: 13.5
  doc: Some documentation about this parameter
  id: r_cpar_cut
  inputBinding:
    prefix: --r_cpar_cut=
    separate: false
  label: r_cpar_cut
  type: float
- default: 16.0
  doc: Some documentation about this parameter
  id: r_lo_cut
  inputBinding:
    prefix: --r_lo_cut=
    separate: false
  label: r_lo_cut
  type: float
- default: 19.6
  doc: Some documentation about this parameter
  id: r_hi_cut
  inputBinding:
    prefix: --r_hi_cut=
    separate: false
  label: r_hi_cut
  type: float
- default: 17.5
  doc: Some documentation about this parameter
  id: i_lo_cut
  inputBinding:
    prefix: --i_lo_cut=
    separate: false
  label: i_lo_cut
  type: float
- default: 19.9
  doc: Some documentation about this parameter
  id: i_hi_cut
  inputBinding:
    prefix: --i_hi_cut=
    separate: false
  label: i_hi_cut
  type: float
- default: 2.0
  doc: Some documentation about this parameter
  id: r_i_cut
  inputBinding:
    prefix: --r_i_cut=
    separate: false
  label: r_i_cut
  type: float
- default: 42
  doc: Some documentation about this parameter
  id: random_seed
  inputBinding:
    prefix: --random_seed=
    separate: false
  label: random_seed
  type: int
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: shear_catalog
  inputBinding:
    prefix: --shear_catalog
  label: shear_catalog
  type: File
- doc: Some documentation about the input
  format: http://edamontology.org/format_2330
  id: calibration_table
  inputBinding:
    prefix: --calibration_table
  label: calibration_table
  type: File
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: photometry_catalog
  inputBinding:
    prefix: --photometry_catalog
  label: photometry_catalog
  type: File
- doc: Configuration file
  format: http://edamontology.org/format_3750
  id: config
  inputBinding:
    prefix: --config
  label: config
  type: File
label: TXSelector
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_3590
  id: tomography_catalog
  label: tomography_catalog
  outputBinding:
    glob: tomography_catalog.hdf5
  type: File
