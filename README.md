# Analysis of Large-Scale Collection of Language-Level Provenance

This directory contains the analysis of ~14,000 language-level provenance graphs collected using the `rdtLite` variant of the [RDataTracker](https://www.github.com/End-to-end-provenance/RDataTracker) collection tool from R scripts hosted on Harvard's Dataverse as part of the [RaaS](https://www.github.com/jwons/raas) evaluation. 

The raw data is not included in this repository as it is ~100 GB; however, some aggregate data is stored in [`output/prov_table.csv`](output/prov_table.csv). We generated this file using the [`generate_aggregate_table.ipynb`](scripts/generate_aggregate_table.ipynb) script. 

If you have Docker installed you can execute the scripts in this repository by starting a Jupyter Lab session by calling `start_container.sh`. Please be aware if you don't have the original raw data, you cannot execute [`generate_aggregate_table.ipynb`](scripts/generate_aggregate_table.ipynb).
