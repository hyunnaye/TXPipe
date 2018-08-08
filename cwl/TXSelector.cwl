#!/usr/bin/env cwl-runner

arguments:
- {loadContents: false, position: -1, separate: true, shellQuote: true, valueFrom: -mtxpipe}
- {loadContents: false, position: 0, separate: true, shellQuote: true, valueFrom: TXSelector}
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    Selects and constructs metacal calibrations for tomographic bins of objects\n\
  \n    "
id: TXSelector
inputs:
  T_cut:
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --T_cut=, separate: false, shellQuote: true}
    label: T_cut
    type: float
  chunk_rows:
    default: 10000
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --chunk_rows=, separate: false, shellQuote: true}
    label: chunk_rows
    type: int
  config:
    doc: Configuration file
    format: YamlFile
    inputBinding: {loadContents: false, prefix: --config, separate: true, shellQuote: true}
    label: config
    type: File
  delta_gamma:
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --delta_gamma=, separate: false, shellQuote: true}
    label: delta_gamma
    type: float
  max_rows:
    default: 0
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --max_rows=, separate: false, shellQuote: true}
    label: max_rows
    type: int
  photoz_pdfs:
    doc: Some documentation about the input
    format: PhotozPDFFile
    inputBinding: {loadContents: false, prefix: --photoz_pdfs, separate: true, shellQuote: true}
    label: photoz_pdfs
    type: File
  s2n_cut:
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --s2n_cut=, separate: false, shellQuote: true}
    label: s2n_cut
    type: float
  shear_catalog:
    doc: Some documentation about the input
    format: MetacalCatalog
    inputBinding: {loadContents: false, prefix: --shear_catalog, separate: true, shellQuote: true}
    label: shear_catalog
    type: File
  zbin_edges:
    doc: Some documentation about this parameter
    inputBinding: {itemSeparator: ',', loadContents: false, prefix: --zbin_edges=,
      separate: false, shellQuote: true}
    label: zbin_edges
    type: {items: float, type: array}
label: TXSelector
outputs:
  tomography_catalog:
    doc: Some results produced by the pipeline element
    format: TomographyCatalog
    label: tomography_catalog
    outputBinding: {glob: tomography_catalog.hdf}
    type: File
