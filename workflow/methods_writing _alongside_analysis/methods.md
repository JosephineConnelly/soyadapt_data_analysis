---
title: "Thesis Part 2"
date: "2023-02-09"
author: "Josephine Estelle Ananda Connelly"
bibliography: "bibliography.bib"
link-citations: true
urlcolor: "blue"
---

# methods

## set the scene

## Data presentation
*My data*

*My data as i recive it*

So what Torben did

## 1. Setup Project

To compile my data for data analysis i need to extract the snp data from the 10 known founders from the 20087 accessions in the data.
I have a list of 10 founders (resources/start_data/founders.txt)
i extracted the founders from the gringlobal 50ksnp data using bcftools
The data file is downloaded from https://soybase.org/snps/
soysnp50k_wm82.a2_41317.vcf.gz

Using bcftools i renamed all the chromosomes to the same. (Gm01-Gm20)
i made files only including data attached to the refrence chromosomes, so no scaffolds or mt data. 

## 2. Merge data for analysis

intersect
i intersected the data. 
So only keeping the 50kSNP data for all accessions

## impute step not now
*initial look at the data and the quality*

*merge the WGS VCF files and the 'founders'*

*inpute with beagle*

"Strategies for Obtaining and Pruning Imputed Whole-Genome Sequence Data for Genomic Prediction [@ye19]"
Whole genomic prediction (WGP) on wgs does not neciserilly increase genomic prediction[@ye19]


according to chat gpt"When preparing a reference panel for use with Beagle, there are several factors to consider:

    Size of the reference panel: The size of the reference panel is important because a larger reference panel provides more information for imputing missing values. However, larger reference panels also require more computational resources to process.

    Diversity of the reference panel: The reference panel should be representative of the population that you are studying. If the reference panel is not diverse enough, it may not be possible to accurately impute missing values in some individuals.

    Quality of the reference panel: The reference panel should be of high quality, with accurate genotype calls and low levels of missing data. High levels of missing data in the reference panel can limit the accuracy of the imputed values.

    Format of the reference panel: The reference panel should be in VCF format and should be compatible with the input VCF file that you are imputing missing values in.

    Overlap with the input VCF file: Ideally, the reference panel should have some overlap with the individuals in the input VCF file. This allows Beagle to use the observed genotype data to improve the accuracy of the imputed values.

    Maintenance of the reference panel: The reference panel should be updated periodically to account for new genetic data and changes in the population. Keeping the reference panel up-to-date will help to ensure that the imputed values are as accurate as possible."

1. prepare a refrence pannel
   consider bias
   For the refrence pannel i think it makes sense to use the CCA data. This is a spectrum of soybeans from all over with a diversity the similar to the entirety of the GRIN soybean germplasm. 
   If we were sure of the realtionship of the founders to the SBPA the accuracy of the imputation could be increased, but since this relation is what we actually want to test, the using a refrence pannel that includes soy from the spectrum of soybean makes most sense. 

   consider size, 


## 3. Filter 


i am going to checking for sample duplication and remove with IBS/IBD thresholds of 95 or 99% to declare samples as identical. as in @pavan20
## 4. Generate metadata

# H1

# H2
# H2 Fst
# H2 pi
# Theta calculation?
# H2 LD
viltered the populations seperetly using 

vcftools --gzvcf snp_cca.vcf.gz --maf 0.05 --recode --stdout | bgzip -c > snp_cca_maf005.vcf.gz
vcftools --gzvcf snp_sbpa.vcf.gz --maf 0.05 --recode --stdout | bgzip -c > snp_sbpa_maf005.vcf.gz
# H3
# H3 Fst
filter total data at maf 5%
vcftools --maf 0.05 then vcftools --weir-fst-pop cca.txt no window. 

# H3 Tajimas D
calculated with vcftools ref
Tajimas D is calculated generally as follows
pi - theta
how the program does it. 

https://github.com/vcftools/vcftools/blob/f7aee6d26885064d834199052573e31338240b76/src/cpp/variant_file_output.cpp#L3940