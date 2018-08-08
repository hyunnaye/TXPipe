#!/usr/bin/env cwl-runner

class: Workflow
cwlVersion: v1.0
label: LSST DESC 3x2pt analysis pipeline
doc: |
  # LSST DESC 3x2pt analysis pipeline
  ![txpipe](https://github.com/EiffL/TXPipe/raw/master/doc/txlogo.png)  

  This is a collection of modules for the DESC 3x2pt pipeline.
  We will build up the modules needed for the analysis as shown in the Pipelines repository.
  It builds on the ceci repository for the infrastructure.

inputs:
  Mstar@TXRandomCat: {default: 23.0, id: Mstar@TXRandomCat, label: Mstar, type: float}
  T_cut@TXSelector: {id: T_cut@TXSelector, label: T_cut, type: float}
  alpha@TXRandomCat: {default: -1.25, id: alpha@TXRandomCat, label: alpha, type: float}
  bands@TXRandomPhotozPDF: {default: ugriz, id: bands@TXRandomPhotozPDF, label: bands,
    type: string}
  bin_slop@TXTwoPoint: {default: 0.1, id: bin_slop@TXTwoPoint, label: bin_slop, type: float}
  calcs@TXTwoPoint:
    default: [0, 1, 2]
    id: calcs@TXTwoPoint
    label: calcs
    type: {items: int, type: array}
  chunk_rows@TXDiagnosticMaps: {default: 100000, id: chunk_rows@TXDiagnosticMaps,
    label: chunk_rows, type: int}
  chunk_rows@TXPhotozStack: {default: 5000, id: chunk_rows@TXPhotozStack, label: chunk_rows,
    type: int}
  chunk_rows@TXRandomPhotozPDF: {default: 10000, id: chunk_rows@TXRandomPhotozPDF,
    label: chunk_rows, type: int}
  chunk_rows@TXSelector: {default: 10000, id: chunk_rows@TXSelector, label: chunk_rows, type: int}
  config: {format: "desc:YamlFile", id: config, label: config, type: File}
  cores_per_task@TXTwoPoint: {default: 20, id: cores_per_task@TXTwoPoint, label: cores_per_task,
    type: int}
  dec_max@TXDiagnosticMaps: {default: .nan, id: dec_max@TXDiagnosticMaps, label: dec_max,
    type: float}
  dec_min@TXDiagnosticMaps: {default: .nan, id: dec_min@TXDiagnosticMaps, label: dec_min,
    type: float}
  delta_gamma@TXSelector: {id: delta_gamma@TXSelector, label: delta_gamma, type: float}
  density@TXRandomCat: {default: 100.0, id: density@TXRandomCat, label: density, type: float}
  depth_band@TXDiagnosticMaps: {default: i, id: depth_band@TXDiagnosticMaps, label: depth_band,
    type: string}
  flip_g2@TXTwoPoint: {default: true, id: flip_g2@TXTwoPoint, label: flip_g2, type: boolean}
  max_rows@TXSelector: {default: 0, id: max_rows@TXSelector, label: max_rows, type: int}
  max_sep@TXTwoPoint: {default: 250, id: max_sep@TXTwoPoint, label: max_sep, type: int}
  min_sep@TXTwoPoint: {default: 2.5, id: min_sep@TXTwoPoint, label: min_sep, type: float}
  nbins@TXTwoPoint: {default: 20, id: nbins@TXTwoPoint, label: nbins, type: int}
  nside@TXDiagnosticMaps: {default: 0, id: nside@TXDiagnosticMaps, label: nside, type: int}
  nz@TXRandomPhotozPDF: {id: nz@TXRandomPhotozPDF, label: nz, type: int}
  photometry_catalog: {format: "desc:HDFFile", id: photometry_catalog, label: photometry_catalog,
    type: File}
  pixel_size@TXDiagnosticMaps: {default: .nan, id: pixel_size@TXDiagnosticMaps, label: pixel_size,
    type: float}
  pixelization@TXDiagnosticMaps: {default: healpix, id: pixelization@TXDiagnosticMaps,
    label: pixelization, type: string}
  ra_max@TXDiagnosticMaps: {default: .nan, id: ra_max@TXDiagnosticMaps, label: ra_max,
    type: float}
  ra_min@TXDiagnosticMaps: {default: .nan, id: ra_min@TXDiagnosticMaps, label: ra_min,
    type: float}
  s2n_cut@TXSelector: {id: s2n_cut@TXSelector, label: s2n_cut, type: float}
  sep_units@TXTwoPoint: {default: arcmin, id: sep_units@TXTwoPoint, label: sep_units,
    type: string}
  shear_catalog: {format: "desc:MetacalCatalog", id: shear_catalog, label: shear_catalog,
    type: File}
  sigma_e@TXRandomCat: {default: 0.27, id: sigma_e@TXRandomCat, label: sigma_e, type: float}
  snr_delta@TXDiagnosticMaps: {default: 1.0, id: snr_delta@TXDiagnosticMaps, label: snr_delta,
    type: float}
  snr_threshold@TXDiagnosticMaps: {id: snr_threshold@TXDiagnosticMaps, label: snr_threshold,
    type: float}
  sparse@TXDiagnosticMaps: {default: true, id: sparse@TXDiagnosticMaps, label: sparse,
    type: boolean}
  verbose@TXTwoPoint: {default: 1, id: verbose@TXTwoPoint, label: verbose, type: int}
  zbin_edges@TXSelector:
    id: zbin_edges@TXSelector
    label: zbin_edges
    type: {items: float, type: array}
  zmax@TXRandomPhotozPDF: {id: zmax@TXRandomPhotozPDF, label: zmax, type: float}
outputs:
  twopoint_data: {format: "desc:HDFFile", id: twopoint_data, label: twopoint_data, outputSource: TXTwoPoint/twopoint_data,
    type: File}
steps:
  TXDiagnosticMaps:
    id: TXDiagnosticMaps
    in: {chunk_rows: chunk_rows@TXDiagnosticMaps, config: config, dec_max: dec_max@TXDiagnosticMaps,
      dec_min: dec_min@TXDiagnosticMaps, depth_band: depth_band@TXDiagnosticMaps,
      nside: nside@TXDiagnosticMaps, photometry_catalog: photometry_catalog, pixel_size: pixel_size@TXDiagnosticMaps,
      pixelization: pixelization@TXDiagnosticMaps, ra_max: ra_max@TXDiagnosticMaps,
      ra_min: ra_min@TXDiagnosticMaps, snr_delta: snr_delta@TXDiagnosticMaps, snr_threshold: snr_threshold@TXDiagnosticMaps,
      sparse: sparse@TXDiagnosticMaps}
    out: [diagnostic_maps]
    run: TXDiagnosticMaps.cwl
  TXPhotozStack:
    id: TXPhotozStack
    in: {chunk_rows: chunk_rows@TXPhotozStack, config: config, photoz_pdfs: TXRandomPhotozPDF/photoz_pdfs,
      tomography_catalog: TXSelector/tomography_catalog}
    out: [photoz_stack]
    run: TXPhotozStack.cwl
  TXRandomCat:
    id: TXRandomCat
    in: {Mstar: Mstar@TXRandomCat, alpha: alpha@TXRandomCat, config: config, density: density@TXRandomCat,
      diagnostic_maps: TXDiagnosticMaps/diagnostic_maps, sigma_e: sigma_e@TXRandomCat,
      tomography_catalog: TXSelector/tomography_catalog}
    out: [random_cats]
    run: TXRandomCat.cwl
  TXRandomPhotozPDF:
    id: TXRandomPhotozPDF
    in: {bands: bands@TXRandomPhotozPDF, chunk_rows: chunk_rows@TXRandomPhotozPDF,
      config: config, nz: nz@TXRandomPhotozPDF, photometry_catalog: photometry_catalog,
      zmax: zmax@TXRandomPhotozPDF}
    out: [photoz_pdfs]
    run: TXRandomPhotozPDF.cwl
  TXSelector:
    id: TXSelector
    in: {T_cut: T_cut@TXSelector, chunk_rows: chunk_rows@TXSelector, config: config,
      delta_gamma: delta_gamma@TXSelector, max_rows: max_rows@TXSelector, photoz_pdfs: TXRandomPhotozPDF/photoz_pdfs,
      s2n_cut: s2n_cut@TXSelector, shear_catalog: shear_catalog, zbin_edges: zbin_edges@TXSelector}
    out: [tomography_catalog]
    run: TXSelector.cwl
  TXTwoPoint:
    id: TXTwoPoint
    in: {bin_slop: bin_slop@TXTwoPoint, calcs: calcs@TXTwoPoint, config: config, cores_per_task: cores_per_task@TXTwoPoint,
      flip_g2: flip_g2@TXTwoPoint, max_sep: max_sep@TXTwoPoint, min_sep: min_sep@TXTwoPoint,
      nbins: nbins@TXTwoPoint, random_cats: TXRandomCat/random_cats, sep_units: sep_units@TXTwoPoint,
      shear_catalog: shear_catalog, tomography_catalog: TXSelector/tomography_catalog,
      verbose: verbose@TXTwoPoint}
    out: [twopoint_data]
    run: TXTwoPoint.cwl


s:author:
  - class: s:Person
    s:identifier:  https://orcid.org/0000-0001-9789-9646
    s:email: mailto:joe.s.email
    s:name: Joe Zuntz

s:contributor:
  - class: s:Person
    s:email: mailto:emily.s.email
    s:name: Emily Longley

  - class: s:Person
    s:identifier: http://orcid.org/0000-0001-7956-0542
    s:email: mailto:francois.lanusse@gmail.com
    s:name: Francois Lanusse

  - class: s:Person
    s:identifier: http://orcid.org/0000-0001-1234-0000
    s:email: mailto:chichway.s.email
    s:name: Chichway Chang

s:codeRepository: https://github.com/LSSTDESC/TXPipe
s:license: https://spdx.org/licenses/BSD-3-Clause.html


$namespaces:
  s: http://schema.org/
  desc: https://www.lsst-desc.org/formats/

$schemas:
 - http://schema.org/docs/schema_org_rdfa.html
