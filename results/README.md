# project folder for data analysis Soybean project: soyadapt_data_analysis

Josephine Estelle Ananda Connelly MSc Biology Aarhus University
This is my repository for the data analysis in my thesis
The data analysis is done and will be specified at the top of each workflow: 
    - on my mac computer ZSH
    - on the GenomeDK cluster in BASH

The setup and startingpoint of the project is in the notebook startfile.ipynb

i will keep this standardised structure adapted from https://snakemake.readthedocs.io/en/stable/snakefiles/best_practices.html#snakefiles-best-practices
i will keep the filestructure and contents up to date!
Last updated see last commit. 

# project structure

project name is <soyadapt_data_analysis>

├── .gitignore

├── README.md

├── LICENSE.md

├── results

├── resources

│   ├── start_data

|   │   ├── collected_start_data.vcf

|   │   ├── collected_start_data.vcf.gz

|   │   ├── collected_start_data.vcf.gz.csi

|   │   ├── collected_start_data.vcf.gz.tbi

|   │   ├── chr.txt

|   │   ├── population_groups.xls

|   │   └── population_groups.xls

|   └── generated_data

|   │   └── logfile

├── workflow

│   ├── envs

|   │   ├── pp_env_x86.yaml

|   │   └── pp_env_linux.yaml

│   ├── scripts

|   │   ├── script1.py

|   │   └── script2.R

│   ├── notebooks

|   │   ├── startfile.py.ipynb (this file!)

|   │   └── notebook2.r.ipynb

│   ├── report

|   │   ├── plot1.rst

|   │   └── plot2.rst

|   └── gwsfile

├── config

│   ├── config.yaml

│   └── some-sheet.tsv


for the thesis text see repo JosephineConnelly/thesis_josephine
