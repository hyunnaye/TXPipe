#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXPSFDiagnostics
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    "
id: TXPSFDiagnostics
inputs:
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: star_catalog
  inputBinding:
    prefix: --star_catalog
  label: star_catalog
  type: File
- doc: Configuration file
  format: http://edamontology.org/format_3750
  id: config
  inputBinding:
    prefix: --config
  label: config
  type: File
label: TXPSFDiagnostics
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: e1_psf_residual_hist
  label: e1_psf_residual_hist
  outputBinding:
    glob: e1_psf_residual_hist.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: e2_psf_residual_hist
  label: e2_psf_residual_hist
  outputBinding:
    glob: e2_psf_residual_hist.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: T_psf_residual_hist
  label: T_psf_residual_hist
  outputBinding:
    glob: T_psf_residual_hist.png
  type: File
