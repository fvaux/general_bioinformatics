# general_bioinformatics

## fas2fasta.sh
Simple shell script with unix loop using mv function that changes all the filenames of all .fas files in a directory to .fasta.

## retrieve-fastq-fq.sh
Shell script with unix loop using cp function, which finds and copies a requested set demultiplexed Illumina reads. Useful for finding reads in large archives.

Uses .csv file with sample name prefixes to search for .fastq.gz and .fq.gz files (can be in multiple directories) with matching prefixes. Script then copies matching files to a new directory. Based on file counts, script provides some basic warnings for potential sample duplicates (e.g. sequencing replicates with matching prefixes) and when there are an odd number of reads (i.e. if R1 or R2 file missing).

### Note
Some scripts were generated with assistance from ChatGTP.
