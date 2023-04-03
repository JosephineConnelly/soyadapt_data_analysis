#!/bin/bash
#SBATCH --account=QGG_plants
#SBATCH --job-name=intersect_v2                           # Job name
##SBATCH --mail-type=END,FAIL                          # Mail events (NONE, BEGIN, END, FAIL, ALL)
##SBATCH --mail-user=josephineconnelly@qgg.au.dk     # Where to send mail
#SBATCH --ntasks=1                                    #
#SBATCH --cpus-per-task=4                             # CPU cores per task
#SBATCH --mem-per-cpu=8G                              # Minimum memory required per allocated CPU in megabytes
#SBATCH --time=10:00:00                               # Time limit hrs:min:sec
#SBATCH --output=serial_output_%j.out                  # Standard output and error log



source /home/joco/miniconda3/etc/profile.d/conda.sh
conda activate soy_data_setup

cd /home/joco/faststorage/data_analysis_soy

bcftools isec /home/joco/faststorage/data_analysis_soy/cca_sbpa_Gm_only.vcf.gz /home/joco/faststorage/data_analysis_soy/founders_Gm_only.vcf.gz -p /home/joco/faststorage/data_analysis_soy/output_dir

#the second file generated called 0002.vcf.gz contains the SNPs that are present in both input files.

bcftools view /home/joco/faststorage/data_analysis_soy/output_dir/0002.vcf.gz -Oz -o /home/joco/faststorage/data_analysis_soy/intersect_cca_sbpa_f.vcf.gz 

bcftools index /home/joco/faststorage/data_analysis_soy/intersect_cca_sbpa_f.vcf.gz