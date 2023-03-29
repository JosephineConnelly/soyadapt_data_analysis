#!/bin/bash
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --account=QGG_plants
#SBATCH -t 24:0:0
#SBATCH --mem=16g
#SBATCH --job-name vcftools

# Torben Asp March 2023
# Script to filter for minor allele frequency


conda activate vcftools

vcftools --vcf soybean_resequencing_MQ30.vcf --maf 0.01 --recode --recode-INFO-all --out soybean_resequencing_MQ30_maf_0.01

