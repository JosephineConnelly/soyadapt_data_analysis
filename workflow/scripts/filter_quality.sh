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

#do the same for the cca_sbpa
#no need to rename the chromosomes
#only include chromosomes
conda activate soy_data_setup

cd joco/faststorage/data_analysis_soy/






echo hello world
conda activate soy_data_setup
cd /home/joco/faststorage/data_analysis_soy
pwd

#quality filter qf
# specify the input VCF file name
# remove MAF < 1% 
# remove SNPs with >20% missing calls
# remove sites with >10% heterozygosity and monomorphic SNPs
# remove sites with missing data > 5%
# remove non-biallelic sites
# specify the output filetype -Oz (.vcf.gz)
# specify the output VCF file name

bcftools filter cca_sbpa_Gm.vcf.gz \
-e 'INFO/AF < 0.01' \ 
-e 'F_MISSING > 0.20' \ 
-e 'HET > 0.10 || (ALT="." && REF!="N")' \ 
-e 'F_MISSING > 0.05' \ 
-e 'N_ALLELES != 2' \ 
-Oz -o filtered/cca_sbpa_f_qf.vcf.gz 

bcftools index cca_sbpa_f_qf.vcf.gz