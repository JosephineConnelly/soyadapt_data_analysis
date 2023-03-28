#!/bin/bash
#SBATCH --account=QGG_plants
#SBATCH --job-name=quality_filter                       # Job name
##SBATCH --mail-type=END,FAIL                          # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=josephineconnelly@qgg.au.dk     # Where to send mail
#SBATCH --ntasks=1                                    #
#SBATCH --cpus-per-task=4                             # CPU cores per task
#SBATCH --mem-per-cpu=8G                              # Minimum memory required per allocated CPU in megabytes
#SBATCH --time=06:00:00                               # Time limit hrs:min:sec
#SBATCH --output=serial_output_%j.out                  # Standard output and error log


# Initialize conda with either of the following options:

# 1. Source your .bashrc

#source /wsu/zz/zz99/zz9992/.bashrc

# Activate your conda env

#conda activate myenv 


source /home/joco/miniconda3/etc/profile.d/conda.sh
conda activate soy_data_setup
 # here i am trying the quality filter (qf) for the cca_sbpa
cd /home/joco/faststorage/data_analysis_soy

#quality filter qf
# specify the input VCF file name cca_sbpa_Gm_only.vcf.gz
# remove MAF < 1% 
# remove SNPs with >20% missing calls
# remove sites with >10% heterozygosity and monomorphic SNPs
# remove sites with missing data > 5%
# remove non-biallelic sites
# specify the output filetype -Oz (.vcf.gz)
# specify the output VCF file name and destination

bcftools filter cca_sbpa_Gm_only.vcf.gz -e INFO/AF < 0.01 -e F_MISSING > 0.20 -e HET > 0.10 || (ALT="." && REF!="N") -e F_MISSING > 0.05 -e N_ALLELES != 2 -Oz -o filtered/cca_sbpa_qf.vcf.gz 

# index the filtered file

bcftools index cca_sbpa_qf.vcf.gz

#count snps in the filtered file there were 9677024 snps in the original file
bcftools view --no-header -G -m 2 -M 2 --types snps cca_sbpa_qf.vcf.gz | wc -l