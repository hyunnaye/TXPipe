#!/usr/bin/env cwl-runner

arguments:
- {loadContents: false, position: -1, separate: true, shellQuote: true, valueFrom: -mtxpipe}
- {loadContents: false, position: 0, separate: true, shellQuote: true, valueFrom: TXProtoDC2Mock}
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    This stage simulates metacal data and metacalibrated\n    photometry measurements,\
  \ starting from a cosmology catalogs\n    of the kind used as an input to DC2 image\
  \ and obs-catalog simulations.\n\n    This is mainly useful for testing infrastructure\
  \ in advance\n    of the DC2 catalogs being available, but might also be handy\n\
  \    for starting from a purer simulation.\n    "
id: TXProtoDC2Mock
inputs:
  cat_name:
    default: protoDC2_test
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --cat_name=, separate: false, shellQuote: true}
    label: cat_name
    type: string
  config:
    doc: Configuration file
    format: YamlFile
    inputBinding: {loadContents: false, prefix: --config, separate: true, shellQuote: true}
    label: config
    type: File
  max_size:
    default: 99999999999999
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --max_size=, separate: false, shellQuote: true}
    label: max_size
    type: int
  response_model:
    doc: Some documentation about the input
    format: HDFFile
    inputBinding: {loadContents: false, prefix: --response_model, separate: true,
      shellQuote: true}
    label: response_model
    type: File
  snr_limit:
    default: 4.0
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --snr_limit=, separate: false, shellQuote: true}
    label: snr_limit
    type: float
  visits_per_band:
    default: 165
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --visits_per_band=, separate: false,
      shellQuote: true}
    label: visits_per_band
    type: int
label: TXProtoDC2Mock
outputs:
  photometry_catalog:
    doc: Some results produced by the pipeline element
    format: HDFFile
    label: photometry_catalog
    outputBinding: {glob: photometry_catalog.hdf}
    type: File
  shear_catalog:
    doc: Some results produced by the pipeline element
    format: MetacalCatalog
    label: shear_catalog
    outputBinding: {glob: shear_catalog.fits}
    type: File
