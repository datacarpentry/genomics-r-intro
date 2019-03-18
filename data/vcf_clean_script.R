# Script to import, tidy, and combine multiple vcf files into a tidy data frame
# and save to csv
# Naupaka Zimmerman
# nzimmerman@usfca.edu
# February 27, 2019

# load required packages
library("vcfR")
library("plyr")

# set the path to vcf files (output from the previous pipeline)
path_to_vcf_dir <- "~/.solutions/wrangling-solutions/variant_calling_auto/results/vcf/"

# list all files in the vcf directory
vcf_file_names <- list.files(path_to_vcf_dir)

# extract sample IDs from VCF file names assuming names like
# 'SRR2584863_final_variants.vcf' where the characters before the
# first '_' are the sample ID
sample_ids <- gsub(pattern = "_.*",
                   replacement = "",
                   x = vcf_file_names)

# read in all vcf files in the directory
vcf_objects <- sapply(paste0(path_to_vcf_dir,
                             vcf_file_names),
                      read.vcfR)

# tidy all vcf files, combining data where possible 
tidied_vcf_objects <- lapply(vcf_objects,
                             vcfR2tidy,
                             single_frame = TRUE,
                             info_types = TRUE,
                             format_types = TRUE)

# shorten names of list items to be just sample IDs instead of full paths
names(tidied_vcf_objects) <- sample_ids

# extract out only the first element of each list item, since the second
# element is metadata can can't easily be combined with the rest into a single
# data frame
just_vcf_data <- lapply(tidied_vcf_objects, `[[`, 1)

# combine the three list elements into a single data frame using plyr, and
# add an id column called 'sample_id', a factor vector that encodes the id of
# each sample, extracted from the shortened list item names, assigned above
combined_vcf_data <- ldply(just_vcf_data,
                           .id = "sample_id")

# write out the csv of this single combined data frame
write.csv(combined_vcf_data,
          file = "~/r_data/combined_tidy_vcf.csv",
          row.names = FALSE)
