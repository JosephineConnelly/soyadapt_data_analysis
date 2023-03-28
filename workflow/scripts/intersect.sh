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

bcftools isec cca_sbpa.vcf.gz file2.vcf.gz -p output_dir

#the second file generated called 0002.vcf.gz contains the SNPs that are present in both input files.

bcftools view output_dir/0002.vcf.gz -o intersect_cca_sbpa_f.vcf.gz -Oz

bcftools index intersect_cca_sbpa_f.vcf.gz




