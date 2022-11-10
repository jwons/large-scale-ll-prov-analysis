# Analysis of Large-Scale Collection of Language-Level Provenance

This directory contains the analysis of ~14,000 language-level provenance graphs collected using the `rdtLite` variant of the [RDataTracker](https://www.github.com/End-to-end-provenance/RDataTracker) collection tool from R scripts hosted on Harvard's Dataverse as part of the [RaaS](https://www.github.com/jwons/raas) evaluation. 

The raw data is not included in this repository as it is ~100 GB; however, some aggregate data is stored in [`output/prov_table.csv`](output/prov_table.csv). We generated this file using the [`generate_aggregate_table.ipynb`](scripts/generate_aggregate_table.ipynb) script. A description of the raw data can also be found in markdown in the [`generate_aggregate_table.ipynb`](scripts/generate_aggregate_table.ipynb) script.

If you have Docker installed you can execute the scripts in this repository by starting a Jupyter Lab session by calling `start_container.sh`. **Please be aware of two important facts when doing so:**
 - **Changes made to the scripts will persist!** The Docker container is used purely for the environment, the root of this directory is mounted within the container meaning any changes persist when the container is closed. 
 - if you don't have the original raw data, you cannot execute [`generate_aggregate_table.ipynb`](scripts/generate_aggregate_table.ipynb).
 
If you choose to run the scripts using this environment, `start_container.sh` will build the Docker image and then execute the container with the necessary options to mount the directory and expose port 8888 to the host. When it's ready it will print a message saying:
```
To access the server, open this file in a browser:
        file:///home/jovyan/.local/share/jupyter/runtime/jpserver-7-open.html
    Or copy and paste one of these URLs:
        http://XXXXXXXXXXXX:8888/lab?token=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
     or http://127.0.0.1:8888/lab?token=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

```
Follow one of the urls and you should be able to access a Jupyter Lab instance in the browser. To close the server, press ctrl + c in the terminal where you ran `start_container.sh`. The container will automatically be deleted unless you messed with the options in `start_container.sh`. However, the Docker image it built will not, so eventually you may want to delete it manually. 

If you are already using port 8888 you will have to either stop using it or make changes to the jupyter lab config and run container command to put the jupyter lab server on a different port. 

# Tables included within this repository 

Since we will not include the ~100 GB raw data with this repository, we do include some of the processed tables generated by the first script, [`generate_aggregate_table.ipynb`](scripts/generate_aggregate_table.ipynb).

## Aggregate Table

Included in this repository is a table ( [`prov_table.csv`](output/prov_table.csv) ) containing aggregate information from the raw data. This table contains information on the graph elements for each provenance file, as well as some metadata. The following describes each feature in the table. For more information on the provenance terms, see the [W3C PROV_JSON description](https://www.w3.org/Submission/prov-json/) and the RDataTracker [Extended PROV-JSON](https://github.com/End-to-end-provenance/ExtendedProvJson/blob/master/JSON-format.md)

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

## Function Table

The function table ( [`func_table.csv`](output/func_table.csv) ) contains information on which functions scripts call and the libraries they come from. 

The following table describes each feature in the function table. 

| Feature | Description |
|--------:|:------------|
|doi      | Uniquely identifies each dataset, and can be used to find the original dataset on Dataverse|
|script_name | The name of the script we collected provenance for |
| function_name   | The name of the function the script identified in script_name called |
| library_name | The name of the library the function identified in function_name comes from |
| times_called | The number of times in the script the function is called |

The table is formatted as follows:

|    | doi                    | script_name                                                   |   function_name | library_name   | times_called |
|---:|:-----------------------|:--------------------------------------------------------------|----------------:|:---------------|--------------|
|  0 | doi:XX.XXXX/XXX/XXXXXX | script_name1.R                                                |            plot | graphics       | 4            |
|  1 | doi:XX.XXXX/XXX/XXXXXX | script_name2.R                                                | install.packages| utils          | 1            |


