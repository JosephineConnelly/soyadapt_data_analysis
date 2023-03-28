#!/bin/bash
#SBATCH --account=QGG_plants
#SBATCH --job-name=filter_incl_chr                             # Job name
##SBATCH --mail-type=END,FAIL                          # Mail events (NONE, BEGIN, END, FAIL, ALL)
##SBATCH --mail-user=josephineconnelly@qgg.au.dk     # Where to send mail
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

bcftools view cca_sbpa.vcf.gz --regions Gm01,Gm02,Gm03,Gm04,Gm05,Gm06,Gm07,Gm08,Gm09,Gm10,Gm11,Gm12,Gm13,Gm14,Gm15,Gm16,Gm17,Gm18,Gm19,Gm20 -Oz -o cca_sbpa_Gm_only.vcf.gz

bcftools index cca_sbpa_Gm_only.vcf.gz

#check
#accessions in the file
bcftools query -l cca_sbpa_Gm_only.vcf.gz > log_filter_incl_chr.txt
#chromosomes in the file 
bcftools query -f '%CHROM\n' cca_sbpa_Gm_only.vcf.gz|uniq > log_filter_incl_chr.txt# job paramenters



