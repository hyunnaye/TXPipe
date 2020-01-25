#!/usr/bin/env cwl-runner

arguments:
- position: -1
  valueFrom: -mtxpipe
- position: 0
  valueFrom: TXDiagnosticPlots
baseCommand: python3
class: CommandLineTool
cwlVersion: v1.0
doc: "\n    "
id: TXDiagnosticPlots
inputs:
- default: 100000
  doc: Some documentation about this parameter
  id: chunk_rows
  inputBinding:
    prefix: --chunk_rows=
    separate: false
  label: chunk_rows
  type: int
- default: 0.02
  doc: Some documentation about this parameter
  id: delta_gamma
  inputBinding:
    prefix: --delta_gamma=
    separate: false
  label: delta_gamma
  type: float
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: photometry_catalog
  inputBinding:
    prefix: --photometry_catalog
  label: photometry_catalog
  type: File
- doc: Some documentation about the input
  format: http://edamontology.org/format_3590
  id: shear_catalog
  inputBinding:
    prefix: --shear_catalog
  label: shear_catalog
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
label: TXDiagnosticPlots
outputs:
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: g_psf_T
  label: g_psf_T
  outputBinding:
    glob: g_psf_T.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: g_psf_g
  label: g_psf_g
  outputBinding:
    glob: g_psf_g.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: g1_hist
  label: g1_hist
  outputBinding:
    glob: g1_hist.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: g2_hist
  label: g2_hist
  outputBinding:
    glob: g2_hist.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: g_snr
  label: g_snr
  outputBinding:
    glob: g_snr.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: g_T
  label: g_T
  outputBinding:
    glob: g_T.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: snr_hist
  label: snr_hist
  outputBinding:
    glob: snr_hist.png
  type: File
- doc: Some results produced by the pipeline element
  format: http://edamontology.org/format_1915
  id: mag_hist
  label: mag_hist
  outputBinding:
    glob: mag_hist.png
  type: File
