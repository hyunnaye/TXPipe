#!/usr/bin/env cwl-runner

arguments:
- {loadContents: false, position: -1, separate: true, shellQuote: true, valueFrom: -mtxpipe}
- {loadContents: false, position: 0, separate: true, shellQuote: true, valueFrom: TXPhotozStack}
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    Naively stack photo-z PDFs in bins according to previous selections.\n\
  \n    "
hints:
  - class: DockerRequirement
    dockerPull: quay.io/eiffl/txpipe
id: TXPhotozStack
inputs:
  chunk_rows:
    default: 5000
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
  photoz_pdfs:
    doc: Some documentation about the input
    format: PhotozPDFFile
    inputBinding: {loadContents: false, prefix: --photoz_pdfs, separate: true, shellQuote: true}
    label: photoz_pdfs
    type: File
  tomography_catalog:
    doc: Some documentation about the input
    format: TomographyCatalog
    inputBinding: {loadContents: false, prefix: --tomography_catalog, separate: true,
      shellQuote: true}
    label: tomography_catalog
    type: File
label: TXPhotozStack
outputs:
  photoz_stack:
    doc: Some results produced by the pipeline element
    format: HDFFile
    label: photoz_stack
    outputBinding: {glob: photoz_stack.hdf}
    type: File
