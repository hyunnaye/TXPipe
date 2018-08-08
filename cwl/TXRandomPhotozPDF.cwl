#!/usr/bin/env cwl-runner

arguments:
- {loadContents: false, position: -1, separate: true, shellQuote: true, valueFrom: -mtxpipe}
- {loadContents: false, position: 0, separate: true, shellQuote: true, valueFrom: TXRandomPhotozPDF}
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    This is a placeholder for an actual photoz pipeline!\n\n    At the moment\
  \ it just randomly generates a log-normal PDF for each object.\n    Hopefully the\
  \ real pipeline will be more accurate than that.\n\n    "
id: TXRandomPhotozPDF
hints:
  - class: DockerRequirement
    dockerPull: quay.io/eiffl/txpipe

inputs:
  bands:
    default: ugriz
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --bands=, separate: false, shellQuote: true}
    label: bands
    type: string
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
  nz:
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --nz=, separate: false, shellQuote: true}
    label: nz
    type: int
  photometry_catalog:
    doc: Some documentation about the input
    format: HDFFile
    inputBinding: {loadContents: false, prefix: --photometry_catalog, separate: true,
      shellQuote: true}
    label: photometry_catalog
    type: File
  zmax:
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --zmax=, separate: false, shellQuote: true}
    label: zmax
    type: float
label: TXRandomPhotozPDF
outputs:
  photoz_pdfs:
    doc: Some results produced by the pipeline element
    format: PhotozPDFFile
    label: photoz_pdfs
    outputBinding: {glob: photoz_pdfs.hdf}
    type: File
