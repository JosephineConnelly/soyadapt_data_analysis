#!/bin/bash
#SBATCH --account=QGG_plants
#SBATCH --job-name=intersect                           # Job name
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

mkdir output_dir

#intersect the two files
bcftools isec cca_sbpa_Gm_only.vcf.gz founders_Gm_only.vcf.gz -p output_dir

#merge

#the second file generated called 0002.vcf.gz contains the SNPs that are present in the first input file but not in the second input file.

#the third file generated called 0003.vcf.gz contains the SNPs that are present in the second input file but not in the first input file.

#to get the intersection of the two files we need to merge the second and third file. The --merge all option will merge the two files and keep only the SNPs that are present in both files.
bgzip < /home/joco/faststorage/data_analysis_soy/output_dir/0002.vcf > /home/joco/faststorage/data_analysis_soy/output_dir/0002.vcf.gz

bgzip < /home/joco/faststorage/data_analysis_soy/output_dir/0003.vcf > /home/joco/faststorage/data_analysis_soy/output_dir/0003.vcf.gz

bcftools index /home/joco/faststorage/data_analysis_soy/output_dir/0002.vcf.gz
bcftools index /home/joco/faststorage/data_analysis_soy/output_dir/0003.vcf.gz

bcftools merge --merge all /home/joco/faststorage/data_analysis_soy/output_dir/0002.vcf.gz /home/joco/faststorage/data_analysis_soy/output_dir/0003.vcf.gz -Oz -o /home/joco/faststorage/data_analysis_soy/output_dir/intersect.vcf.gz

bcftools index /home/joco/faststorage/data_analysis_soy/output_dir/intersect.vcf.gz