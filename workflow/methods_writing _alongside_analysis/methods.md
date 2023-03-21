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

So what torben did to it

## 1. Setup Project

## 2. Merge data for analysis

merge and intersect


impute step: 
see my github for the layout of the project

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