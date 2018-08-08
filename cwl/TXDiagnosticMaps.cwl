#!/usr/bin/env cwl-runner

arguments:
- {loadContents: false, position: -1, separate: true, shellQuote: true, valueFrom: -mtxpipe}
- {loadContents: false, position: 0, separate: true, shellQuote: true, valueFrom: TXDiagnosticMaps}
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    For now, this Pipeline Stage computes a depth map using the DR1 method,\n\
  \    which takes the mean magnitude of objects close to 5-sigma S/N.\n\n    In the\
  \ future we will add the calculation of other diagnostic maps\n    like airmass\
  \ for use in systematics tests and covariance mode projection.\n\n    DM may in\
  \ the future provide tools we can use in place of the methods\n    used here, but\
  \ not on the DC2 timescale.\n\n    "
hints:
  - class: DockerRequirement
    dockerPull: quay.io/eiffl/txpipe

id: TXDiagnosticMaps
inputs:
  chunk_rows:
    default: 100000
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --chunk_rows=, separate: false, shellQuote: true}
    label: chunk_rows
    type: int
  config:
    doc: Configuration file
    format: "desc:YamlFile"
    inputBinding: {loadContents: false, prefix: --config, separate: true, shellQuote: true}
    label: config
    type: File
  dec_max:
    default: .nan
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --dec_max=, separate: false, shellQuote: true}
    label: dec_max
    type: float
  dec_min:
    default: .nan
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --dec_min=, separate: false, shellQuote: true}
    label: dec_min
    type: float
  depth_band:
    default: i
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --depth_band=, separate: false, shellQuote: true}
    label: depth_band
    type: string
  nside:
    default: 0
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --nside=, separate: false, shellQuote: true}
    label: nside
    type: int
  photometry_catalog:
    doc: Some documentation about the input
    format: "desc:HDFFile"
    inputBinding: {loadContents: false, prefix: --photometry_catalog, separate: true,
      shellQuote: true}
    label: photometry_catalog
    type: File
  pixel_size:
    default: .nan
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --pixel_size=, separate: false, shellQuote: true}
    label: pixel_size
    type: float
  pixelization:
    default: healpix
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --pixelization=, separate: false,
      shellQuote: true}
    label: pixelization
    type: string
  ra_max:
    default: .nan
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --ra_max=, separate: false, shellQuote: true}
    label: ra_max
    type: float
  ra_min:
    default: .nan
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --ra_min=, separate: false, shellQuote: true}
    label: ra_min
    type: float
  snr_delta:
    default: 1.0
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --snr_delta=, separate: false, shellQuote: true}
    label: snr_delta
    type: float
  snr_threshold:
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --snr_threshold=, separate: false,
      shellQuote: true}
    label: snr_threshold
    type: float
  sparse:
    default: true
    doc: Some documentation about this parameter
    inputBinding: {loadContents: false, prefix: --sparse, separate: true, shellQuote: true}
    label: sparse
    type: boolean
label: TXDiagnosticMaps
outputs:
  diagnostic_maps:
    doc: Some results produced by the pipeline element
    format: "desc:DiagnosticMaps"
    label: diagnostic_maps
    outputBinding: {glob: diagnostic_maps.hdf}
    type: File

$namespaces:
    desc: https://www.lsst-desc.org/formats/
