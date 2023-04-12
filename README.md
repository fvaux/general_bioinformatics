# general_bioinformatics

## fas2fasta.sh
Shell script with unix loop to change filenames from .fas to .fasta

## retrieve-fastq-fq.sh
Shell script with unix loop used to find and copy demultiplexed Illumina reads. Uses .csv file with sample name prefixes to search for .fastq.gz and .fq.gz files (can be in multiple directories) with matching prefixes. Script then copies matching files to a new directory. Based on file counts, script provides some basic warnings for potential sample duplicates (e.g. sequencing replicates with matching prefixes) and when there are an odd number of reads (i.e. if R1 or R2 file missing).
