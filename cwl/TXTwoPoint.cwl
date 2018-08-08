#!/usr/bin/env cwl-runner

arguments:
- {loadContents: false, position: -1, separate: true, shellQuote: true, valueFrom: -mtxpipe}
- {loadContents: false, position: 0, separate: true, shellQuote: true, valueFrom: TXTwoPoint}
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
hints:
  - class: DockerRequirement
    dockerPull: quay.io/eiffl/txpipe

id: TXTwoPoint
inputs:
  bin_slop:
    default: 0.1
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --bin_slop=, separate: false, shellQuote: true}
    label: bin_slop
    type: float
  calcs:
    default: [0, 1, 2]
    doc: Some documentation about this parameter
    inputBinding: {itemSeparator: ',', loadContents: false, prefix: --calcs=, separate: false,
      shellQuote: true}
    label: calcs
    type: {items: int, type: array}
  config:
    doc: Configuration file
    format: "desc:YamlFile"
    inputBinding: {loadContents: false, prefix: --config, separate: true, shellQuote: true}
    label: config
    type: File
  cores_per_task:
    default: 20
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --cores_per_task=, separate: false,
      shellQuote: true}
    label: cores_per_task
    type: int
  flip_g2:
    default: true
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --flip_g2, separate: true, shellQuote: true}
    label: flip_g2
    type: boolean
  max_sep:
    default: 250
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --max_sep=, separate: false, shellQuote: true}
    label: max_sep
    type: int
  min_sep:
    default: 2.5
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --min_sep=, separate: false, shellQuote: true}
    label: min_sep
    type: float
  nbins:
    default: 20
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --nbins=, separate: false, shellQuote: true}
    label: nbins
    type: int
  random_cats:
    doc: Some documentation about the input
    format: "desc:RandomsCatalog"
    inputBinding: {loadContents: false, prefix: --random_cats, separate: true, shellQuote: true}
    label: random_cats
    type: File
  sep_units:
    default: arcmin
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --sep_units=, separate: false, shellQuote: true}
    label: sep_units
    type: string
  shear_catalog:
    doc: Some documentation about the input
    format: "desc:MetacalCatalog"
    inputBinding: {loadContents: false, prefix: --shear_catalog, separate: true, shellQuote: true}
    label: shear_catalog
    type: File
  tomography_catalog:
    doc: Some documentation about the input
    format: "desc:TomographyCatalog"
    inputBinding: {loadContents: false, prefix: --tomography_catalog, separate: true,
      shellQuote: true}
    label: tomography_catalog
    type: File
  verbose:
    default: 1
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --verbose=, separate: false, shellQuote: true}
    label: verbose
    type: int
label: TXTwoPoint
outputs:
  twopoint_data:
    doc: Some results produced by the pipeline element
    format: "desc:HDFFile"
    label: twopoint_data
    outputBinding: {glob: twopoint_data.hdf}
    type: File

$namespaces:
    desc: https://www.lsst-desc.org/formats/
