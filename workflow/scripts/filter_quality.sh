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

# try with the test file first soybean_resequencing_MQ30.vcf
#then do it to the cca_sbpa_Gm_only.vcf.gz

bgzip < soybean_resequencing_MQ30.vcf > soybean_resequencing_MQ30.vcf.gz

bcftools index soybean_resequencing_MQ30.vcf.gz

bcftools view -m 2 -M 2 --types=snps soybean_resequencing_MQ30.vcf.gz -Ov |bcftools view -S ^<(paste <(bcftools query -f '[%SAMPLE\t]\n' soybean_resequencing_MQ30.vcf.gz | head -1 | tr '\t' '\n') <(bcftools query -f '[%GT\t]\n' soybean_resequencing_MQ30.vcf.gz | awk -v OFS="\t" '{for (i=1;i<=NF;i++) if ($i == "./.") sum[i]+=1 } END {for (i in sum) print i, sum[i] / NR }' | sort -k1,1n | cut -f 2) | awk '{ if ($2 > 0.80) print $1 }') soybean_resequencing_MQ30.vcf.gz | bgzip > testdata_qf.vcf.gz  

bcftools index soybean_qf.vcf.gz
  

#count snps in the filtered file there were 9677024 snps in the original file
bcftools view --no-header -G -m 2 -M 2 --types snps filtered/soybean_resequencing_MQ30_qf.vcf.gz | wc -l

# when the test file worked i did it to the cca_sbpa_Gm_only.vcf.gz

# index the filtered file

#bcftools index cca_sbpa_qf.vcf.gz

#count snps in the filtered file there were 9677024 snps in the original file
#bcftools view --no-header -G -m 2 -M 2 --types snps cca_sbpa_qf.vcf.gz | wc -l