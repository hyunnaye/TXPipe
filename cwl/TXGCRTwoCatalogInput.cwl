#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXGCRTwoCatalogInput
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n\n    "
id: TXGCRTwoCatalogInput
inputs:
- default: /global/projecta/projectdirs/lsst/production/DC2_ImSim/Run2.1i/dpdd/calexp-v1:coadd-dr1b-v1/object_table_parquet
  doc: Some documentation about this parameter
  id: photo_dir
  inputBinding:
    prefix: --photo_dir=
    separate: false
  label: photo_dir
  type: string
- default: false
  doc: Some documentation about this parameter
  id: photo_is_hdf5
  inputBinding:
    prefix: --photo_is_hdf5
  label: photo_is_hdf5
  type: boolean
- default: /global/projecta/projectdirs/lsst/production/DC2_ImSim/Run2.1i/dpdd/coadd-dr1b-v1:metacal-dr1b-v2/metacal_table_summary
  doc: Some documentation about this parameter
  id: metacal_dir
  inputBinding:
    prefix: --metacal_dir=
    separate: false
  label: metacal_dir
  type: string
- doc: Configuration file
  format: http://edamontology.org/format_3750
  id: config
  inputBinding:
    prefix: --config
  label: config
  type: File
label: TXGCRTwoCatalogInput
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_3590
  id: shear_catalog
  label: shear_catalog
  outputBinding:
    glob: shear_catalog.hdf5
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_3590
  id: photometry_catalog
  label: photometry_catalog
  outputBinding:
    glob: photometry_catalog.hdf5
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_3590
  id: star_catalog
  label: star_catalog
  outputBinding:
    glob: star_catalog.hdf5
  type: File
