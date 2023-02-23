# project folder for data analysis Soybean project: soyadapt_data_analysis

Josephine Estelle Ananda Connelly MSc Biology Aarhus University
This is my repository for the data analysis in my thesis
The data analysis is done and will be specified at the top of each workflow: 
    - on my mac computer ZSH
    - on the GenomeDK cluster in BASH

The setup and starting point of the project is in the notebookstartfile.ipynb

i will keep this standardised structure adapted from https://snakemake.readthedocs.io/en/stable/snakefiles/best_practices.html#snakefiles-best-practices
i will keep the file structure and contents up to date!
Last updated see last commit. 

# project structure

project name is <soyadapt_data_analysis>

    ├── .gitignore
    ├── README.md
    ├── LICENSE.md
    ├── .vscode
    │   ├── settings.json
    ├── results
    ├── resources
    │   ├── start_data (no bigger than 100MB!!)
    |   │   ├── tree.txt
    |   │   ├── Population_name_two.txt
    |   │   ├── Population_name_one.txt
    |   │   ├── pop.txt
    |   │   ├── METADATA_soybean_resequencing_MQ30.md
    |   │   └── accessions.xlsx
    |   └── generated_data
    |   │   └── logfiles
    ├── workflow
    │   ├── envs
    |   │   ├── environment_make #step by step how i made the environments in this repository.)
    |   │   ├── pp_env_x86.yaml
    |   │   └── pp_env_x86.txt
    │   ├── scripts
    |   │   ├── some-script1.py
    |   │   └── some-script.R
    │   ├── notebooks
    |   │   ├── step_1_startfile.ipynb
    |   │   ├── step_2_merge.ipynb
    |   │   ├── step_2_merge_2.ipynb
    |   │   ├── step_3_filter.ipynb
    |   │   ├── step_4 metadata_file_generation.ipynb
    |   │   ├── step_8_calculate.ipynb
    |   │   ├── file_conversion.ipynb
    |   │   ├── out.model
    |   │   └── step_8_calculate_R.r.ipynb
    │   ├── reports
    |   │   ├── some-plot1.rst
    |   │   └── some-plot2.rst
    |   └── gwsfile
    ├── config
    │   ├── README.md
    │   ├── some-config.yaml
    │   └── some-sheet.tsv


for the thesis text see repo JosephineConnelly/thesis_josephine
