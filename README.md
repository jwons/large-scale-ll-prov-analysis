# Analysis of Large-Scale Collection of Language-Level Provenance'

This directory contains the analysis of ~14,000 language-level provenance graphs collected using the `rdtLite` variant of the [RDataTracker](https://www.github.com/End-to-end-provenance/RDataTracker) collection tool from R scripts hosted on Harvard's Dataverse as part of the [RaaS](https://www.github.com/jwons/raas) evaluation. 

The raw data is not included in this repository as it is ~100 GB; however, some aggregate data is stored in [`output/prov_table.csv`](output/prov_table.csv). We generated this file using the [`generate_aggregate_table.ipynb`](scripts/generate_aggregate_table.ipynb) script. 

If you have Docker installed you can execute the scripts in this repository by starting a Jupyter Lab session by calling `start_container.sh`. Please be aware if you don't have the original raw data, you cannot execute [`generate_aggregate_table.ipynb`](scripts/generate_aggregate_table.ipynb).

## Aggregate Table

Included in this repository is a table containing aggregate information from the raw data. This table contains information on the graph elements for each provenance file, as well as some metadata. The following describes each feature in the table. For more information on the provenance terms, see the [W3C PROV_JSON description](https://www.w3.org/Submission/prov-json/) and the RDataTracker [Extended PROV-JSON](https://github.com/End-to-end-provenance/ExtendedProvJson/blob/master/JSON-format.md)

| Feature | Description |
|--------:|:------------|
|doi      | Uniquely identifies each dataset, and can be used to find the original dataset on Dataverse|
|script_name | The name of the script we collected provenance for |
| num_of_lines | The number of lines in the original script |
| error   | Boolean value indicating whether the script encountered an error during execution (True) or not (False)|
| num_of_proc_nodes | The number of procedure nodes in the provenance graph |
| num_of_data_nodes | The number of data nodes in the provenance graph |
| num_of_libraries | The number of library nodes, i.e. the number of R packages loaded in the R environment while the script executed |
| num_of_functions | The number of function nodes, i.e. the number of unique functions called from external libraries |
| num_of_pd_edges | The number of procedure node to data node edges |
| num_of_dp_edges | The number of data node to procedure node edges |
| num_of_fp_edges | The number of function node to procedure edges |

The table is formatted as follows:

|    | doi                    | script_name                                                   |   num_of_lines | error   |   num_of_proc_nodes |   num_of_data_nodes |   num_of_libraries |   num_of_functions |   num_of_pd_edges |   num_of_dp_edges |   num_of_fp_edges |
|---:|:-----------------------|:--------------------------------------------------------------|---------------:|:--------|--------------------:|--------------------:|-------------------:|-------------------:|------------------:|------------------:|------------------:|
|  0 | doi:XX.XXXX/XXX/XXXXXX | script_name1.R                |            583 | True    |                  20 |                   9 |                 17 |                  2 |                 6 |                 8 |                 2 |
|  1 | doi:XX.XXXX/XXX/XXXXXX | script_name2.R                                 |            258 | False    |                   4 |                   2 |                  9 |                  0 |                 2 |                 1 |                 0 |
