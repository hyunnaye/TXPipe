#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXFourierGaussianCovariance
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
id: TXFourierGaussianCovariance
inputs:
- doc: Some documentation about the input
  format: http://edamontology.org/format_3750
  id: fiducial_cosmology
  inputBinding:
    prefix: --fiducial_cosmology
  label: fiducial_cosmology
  type: File
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: photoz_stack
  inputBinding:
    prefix: --photoz_stack
  label: photoz_stack
  type: File
- doc: Some documentation about the input
  format: http://edamontology.org/format_1915
  id: twopoint_data_fourier
  inputBinding:
    prefix: --twopoint_data_fourier
  label: twopoint_data_fourier
  type: File
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: diagnostic_maps
  inputBinding:
    prefix: --diagnostic_maps
  label: diagnostic_maps
  type: File
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: tomography_catalog
  inputBinding:
    prefix: --tomography_catalog
  label: tomography_catalog
  type: File
- doc: Configuration file
  format: http://edamontology.org/format_3750
  id: config
  inputBinding:
    prefix: --config
  label: config
  type: File
label: TXFourierGaussianCovariance
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: summary_statistics
  label: summary_statistics
  outputBinding:
    glob: summary_statistics.sacc
  type: File
