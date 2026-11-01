# A Lightweight Detection Pipeline for Earthquake Early Warning and Its Evaluation on Three Seismic Networks

LaTeX sources of the manuscript submitted to *Computers & Geosciences*, its
supplementary material and the cover letter. The figures are included as files,
so neither the code nor the waveform data is needed to build the documents.

The pipeline itself, ayzek, is at https://github.com/hogib/ayzek; the release the
tests ran, v1.0.0, is archived at https://doi.org/10.5281/zenodo.23806743. The tool
that fetches the test data is at https://github.com/hogib/ayzek-heldout.

## Build

With [tectonic](https://tectonic-typesetting.github.io), which fetches the LaTeX
packages it needs, or with a TeX Live installation that has `latexmk`:

```bash
make             # paper.pdf: cover letter, highlights and manuscript, as the journal's template lays them out
make supplement  # supplement.pdf
make cover       # cover_letter.pdf, the cover letter on its own
make clean       # remove intermediate files
```

## Files

| file | content |
|---|---|
| `paper.tex`, `refs.bib` | manuscript and references |
| `supplement.tex` | supplementary material, Sections S1–S25 (each table numbered after its section) |
| `cover_text.tex`, `cover_letter.tex` | cover letter text (included by `paper.tex`) and a standalone cover letter |
| `figures/` | figures of the manuscript, with the CSV files their plots are drawn from; `figures/supp/` holds the supplement's figures |
| `cas-sc.cls`, `cas-common.sty`, `cas-model2-names.bst`, `thumbnails/` | the journal's LaTeX template files, copied unchanged from https://github.com/cageo/CAGEO_LaTeXTemplate (commit 965ebcc; Elsevier CAS bundle, LaTeX Project Public License) |

## Figures

Every figure is drawn by a tool in the code repository (`tools/` in
https://github.com/hogib/ayzek):

| figure | tool |
|---|---|
| Figure 1, `fig_map_development.*` | `plot_map_development.py`: the development stations, the replayed sequences' epicenters and the quiet-window exclusion area (the CSV holds the plotted points) |
| Figure 2, `fig_map_greece.*`, `fig_map_nz.*`, `fig_map_ko.*` | `plot_map_tests.py`, from the four pre-test sets of each network in the fetch tool's repository (drawn before the release date) |
| Figure S1, `fig5_recall_budget.*` | `plot_recall_budget.py`: `curves` writes the CSV from the continuous scan, `plot` draws the figure from it |
| Figure S2, `fig7_operating_curves.*` | `plot_operating_curves.py`: `data` writes the CSV from the trigger grids, `plot` draws the figure from it |
| Figure S3, `fig3_detectors.*` | `plot_detector_summary.py`: `data` writes the CSV from the paired statistics and quiet-window replays, `plot` draws the figure from it |
| Figure S4, `fig6_quiet_alarms.*` | `plot_quiet_figure.py`, on the quiet-window replays |
| `figures/supp/` | `plot_candidates.py` on the quiet-window replays; `quiet_alarms.csv` lists the class of each quiet-window alarm (Table S11) |

Figure 3, `fig1_pipeline.png`, is a diagram.

## Data

The development waveforms from AFAD cannot be redistributed; the KOERI datasets
attached to the releases of the code repository reproduce the principal development
results. The test waveforms (the Greek networks from NOA's EIDA node, New Zealand's
GeoNet and KOERI's KO network) are open at their data centers and are not copied
here: the fetch tool retrieves them, and its request records and file hashes let a
new fetch be checked against the data the tests used.

## License

The manuscript, the supplementary material, the figures and the other files of this
repository are licensed under the Creative Commons Attribution 4.0 International
License (CC BY 4.0), whose full text is in `LICENSE`, except for the journal's
template files listed above, which keep their own license. The pipeline's code is
licensed separately, under the GNU General Public License version 3 or later.
