# Sequencer Output to Diversity Analysis (SODA)

### Authors:
Lennice Castro 

### Introduction:
This program is designed to take a large data set that includes isolated DNA sequences from gut extractions of coral reef fish and the metadata of the samples collected to create a visual that displays different analyses in a viewer friendly graph. 
When the extracted, amplified and purified DNA is sent to be sequenced the output of the sequencer includes  a barcodes.fastq.gz file and a sequences fastq.gz file. This program takes this sequencer output and assigns the bacterial DNA sequences to the fish sample that it is from. However, that is not where this program ends. It also will run the sequences through a quality control step called dada2 in effort of removing low quality sequences. The program will also align the sequences in efforts to us these aligned sequences in which the highly variable positions have been removed to build a phylogenetic tree. Finally, like at previos steps earlier in the program, the end of the program will now make easily digestible visuals of alpha diversity, beta diversity, and emperor plot graphs that will be visualized in QIIME2 View (QIIME2). 

### Program Work Flow:
1. Import Data
2. Import the Data into a QIIME 2 artifact
3. Demultiplex sequences, which means that we are assigning the sequence to a sample
4. Quality control based filtering using DADA2 in effort to remove low quality sequence regions 
5. Generting a feature table and feature data summaries to get information, such as how many sequences are associated to each sample
6. Generating a phylogenetic tree for diversity analyses
7. Analyzing alpha diversity
8. Analyzing beta diversity
9. Creating emperor plot 

### Dependencies:
- Hoffman account
- Cyberduck
- Python
- Quiime 2 (which you can then load onto your terminal)
- barcodes.fastq.gz
- sequences.fastq.gz
- sample-metadata.tsv

### Instructions:
First, You want to create the main directort in which you will run the script and save other subdirectories created by the program.

Second, of course need to have  the following files in your directory:
sequences.fastq.gz 
barcodes.fastq.gz 
sample-metadata.tsv 

You can obtain these files by using the following commands:

```{bash}
wget \
  -O "emp-single-end-sequences/sequences.fastq.gz" \
  "https://data.qiime2.org/2019.4/tutorials/moving-pictures/emp-single-end-sequences/sequences.fastq.gz"
```
```{bash}
wget \
 -O "emp-single-end-sequences/barcodes.fastq.gz" \
  "https://data.qiime2.org/2019.4/tutorials/moving-pictures/emp-single-end-sequences/barcodes.fastq.gz"
```
```{bash}
wget \ 
  -O "sample-metadata.tsv" \
  "https://data.qiime2.org/2019.4/tutorials/moving-pictures/sample_metadata.tsv"
```
 
OR 
you can also download the files onto your computer and copy them from your desktop to your hoffman.

Next, you will move the sequences.fastq.gz and barcodes.fastq.gz into a directory called emp-single end sequences that you create within your main directory. If you need further help you can look at the expected directory structure in directory called masterdir on this github.

Finally, you can use nano to copy and paste the master script called master.sh, which is in the directory masterscript on this github, into a bash script on your terminal

From here you can now just enter the following command:
```{bash}
sh master.sh -i emp-single-end-sequences/ -o output-emp-single-end-sequences -m sample-metadata.tsv -x demultiplex-sequences/ -v visuals/ -a dada2/ -t table-dada2/ -s stats-dada2/ -n aligned-sequences/ -u unrooted-tree/ -r rooted-tree/ -c core-metrics-results/
```


The program will begin making directories, making and saving different files, and comment as it proceeds to do so

### Expected Ouputs:
The following directories are expected to be outputs and their should be various files with in them:

output-emp-single-end-sequences <br>
└── emp-single-end-sequences.qza <br>

demultiplex-sequences <br>
└── demux-details.qza <br>
└── demux.qza <br>

dada2 <br>
└── rep-seqs.qza <br>

table-dada2 <br>
└── table.qza <br>

stats-dada2 <br>
└── stats-dada2.qza <br>

visuals <br>
└── bray-curtis-emperor-DaysSinceExperimentStart.qzv <br>
└── demux.qzv <br>
└── evenness-group-significance.qzv <br>
└── faith-pd-group-significance.qzv <br>
└── rep-seqs.qzv <br>
└── stats-dada2.qzv <br>
└── table.qzv <br>
└── unweighted-unifrac-body-site-significance.qzv <br>
└── unweighted-unifrac-emperor-DaysSinceExperimentStart.qzv <br>
└── unweighted-unifrac-subject-group-significance.qzv <br>

aligned-sequences <br>
└── aligned-rep-seqs.qza <br>
└── masked-aligned-rep-seqs.qza <br>

rooted-tree <br>
└── rooted-tree.qza <br>  

unrooted-tree <br>
└── unrooted-tree.qza <br>

core-metrics-results  
└── core-metrics-results/faith_pd_vector.qza <br> 
└── core-metrics-results/unweighted_unifrac_distance_matrix.qza <br>
└── core-metrics-results/bray_curtis_pcoa_results.qza <br>
└── core-metrics-results/shannon_vector.qza <br>
└── core-metrics-results/rarefied_table.qza <br>
└── core-metrics-results/weighted_unifrac_distance_matrix.qza <br>
└── core-metrics-results/jaccard_pcoa_results.qza <br>
└── core-metrics-results/observed_otus_vector.qza <br>
└── core-metrics-results/weighted_unifrac_pcoa_results.qza <br>
└── core-metrics-results/jaccard_distance_matrix.qza <br>
└── core-metrics-results/evenness_vector.qza <br>
└── core-metrics-results/bray_curtis_distance_matrix.qza <br>
└── core-metrics-results/unweighted_unifrac_pcoa_results.qza <br>
└── core-metrics-results/unweighted_unifrac_emperor.qzv <br>
└── core-metrics-results/jaccard_emperor.qzv <br>
└── core-metrics-results/bray_curtis_emperor.qzv <br>
└── core-metrics-results/weighted_unifrac_emperor.qzv <br>

### References:

1. QIIME2 development team. 2016-2019. “Moving Pictures” tutorial. QIIME2 docs. <https://docs.qiime2.org/2019.4/tutorials/moving-pictures/>
2. Python Software Foundation. Python Language Reference, version 2.7. Available at <http://www.python.org>
3. Anaconda Software Distribution. Computer software. Vers. 2-2.4.0. Anaconda, Nov. 2016. Web. <https://anaconda.com> 
