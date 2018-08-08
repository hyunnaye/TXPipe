#!/usr/bin/env cwl-runner

arguments:
- {loadContents: false, position: -1, separate: true, shellQuote: true, valueFrom: -mtxpipe}
- {loadContents: false, position: 0, separate: true, shellQuote: true, valueFrom: TXRandomCat}
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
hints:
  - class: DockerRequirement
    dockerPull: quay.io/eiffl/txpipe

id: TXRandomCat
inputs:
  Mstar:
    default: 23.0
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --Mstar=, separate: false, shellQuote: true}
    label: Mstar
    type: float
  alpha:
    default: -1.25
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --alpha=, separate: false, shellQuote: true}
    label: alpha
    type: float
  config:
    doc: Configuration file
    format: YamlFile
    inputBinding: {loadContents: false, prefix: --config, separate: true, shellQuote: true}
    label: config
    type: File
  density:
    default: 100.0
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --density=, separate: false, shellQuote: true}
    label: density
    type: float
  diagnostic_maps:
    doc: Some documentation about the input
    format: DiagnosticMaps
    inputBinding: {loadContents: false, prefix: --diagnostic_maps, separate: true,
      shellQuote: true}
    label: diagnostic_maps
    type: File
  sigma_e:
    default: 0.27
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --sigma_e=, separate: false, shellQuote: true}
    label: sigma_e
    type: float
  tomography_catalog:
    doc: Some documentation about the input
    format: TomographyCatalog
    inputBinding: {loadContents: false, prefix: --tomography_catalog, separate: true,
      shellQuote: true}
    label: tomography_catalog
    type: File
label: TXRandomCat
outputs:
  random_cats:
    doc: Some results produced by the pipeline element
    format: RandomsCatalog
    label: random_cats
    outputBinding: {glob: random_cats.hdf}
    type: File
