#!/usr/bin/env cwl-runner

arguments:
- {loadContents: false, position: -1, separate: true, shellQuote: true, valueFrom: -mtxpipe}
- {loadContents: false, position: 0, separate: true, shellQuote: true, valueFrom: TXDRPMockMetacal}
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    Use real photometry from the DRP (output of DM stack) in merged form,\n\
  \    but fake metacal responses for the magnitudes.\n\n    TODO: Shapes!\n    "
hints:
  - class: DockerRequirement
    dockerPull: quay.io/eiffl/txpipe

id: TXDRPMockMetacal
inputs:
  cat_name:
    default: protoDC2_test
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --cat_name=, separate: false, shellQuote: true}
    label: cat_name
    type: string
  config:
    doc: Configuration file
    format: "desc:YamlFile"
    inputBinding: {loadContents: false, prefix: --config, separate: true, shellQuote: true}
    label: config
    type: File
  drp_merged_cat:
    doc: Some documentation about the input
    format: "desc:HDFFile"
    inputBinding: {loadContents: false, prefix: --drp_merged_cat, separate: true,
      shellQuote: true}
    label: drp_merged_cat
    type: File
  max_size:
    default: 99999999999999
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --max_size=, separate: false, shellQuote: true}
    label: max_size
    type: int
  response_model:
    doc: Some documentation about the input
    format: "desc:HDFFile"
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
label: TXDRPMockMetacal
outputs:
  photometry_catalog:
    doc: Some results produced by the pipeline element
    format: "desc:HDFFile"
    label: photometry_catalog
    outputBinding: {glob: photometry_catalog.hdf}
    type: File
  shear_catalog:
    doc: Some results produced by the pipeline element
    format: "desc:MetacalCatalog"
    label: shear_catalog
    outputBinding: {glob: shear_catalog.fits}
    type: File

$namespaces:
    desc: https://www.lsst-desc.org/formats/
