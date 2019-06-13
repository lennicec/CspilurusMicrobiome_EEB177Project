# Sequencer Output to Diversity Analysis (SODA)

### Author:
Lennice Castro 

### Introduction:
Microbial gut communities play an important role in the health of all complex organisms.  In terrestrial vertebrates, past research has shown that gut community composition is largely shaped by the phylogeny and ecology of their hosts (Sullam et al., 2012). However, we know little about gut microbiomes in the largest group of vertebrates—fish, particularly, coral reef fish. As vital components of a healthy coral reef ecosystem, reef fish represent an ideal system to study gut microbiomes within the context of an ecosystem sensitive to human disturbances. Host-microbe interactions can be negatively impacted by environmental disturbances, which can include habitat fragmentation, pollution and/or resource depletion (Bellwood et al., 2004). Thus, to further study the impact of environment, host gender, and host diet on gut microbiota, Chlorurus spilurus were sampled from a broad range of reef habitats around Mo’orea French Polynesia. The sample set included samples from five terminal males and fifteen females. Microbial DNA was extracted from the collected samples using MoBio Powersoil DNA isolation kits and then amplified via PCR. Once sequenced, we hope to analyze the fish gut microbiomes by running them through QIIME2 (QIIME 2 Developmental Team, 2018-2019), using this wrapper code to automate the process, to determine the extent gut microbiomes are influenced by environment, host diet, and host gender. The following text explains what the program does and steps to execute it on your own.

### Program Work Flow:
1. Import Data
2. Import the Data into a QIIME 2 artifact
3. Demultiplex sequences, which means that we are assigning the sequence to a sample
4. Quality control based filtering using DADA2 in effort to remove low quality sequence regions 
5. Generating a feature table and feature data summaries to get information, such as how many sequences are associated to each sample
6. Generating a phylogenetic tree for diversity analyses
7. Analyzing alpha diversity
8. Analyzing beta diversity
9. Creating emperor plot 

### Dependencies:
- Hoffman2
- Python
- Quiime 2 
	- which you can load onto your terminal using python anaconda2 
- barcodes.fastq.gz
- sequences.fastq.gz
- sample-metadata.tsv

### Instructions:
1. You want to create the main directory in which you will run the script and save other subdirectories created by the program, you can call thi whatever you'd like.

2. You need to have  the following files in your directory:
- sequences.fastq.gz 
- barcodes.fastq.gz 
- sample-metadata.tsv 

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
you can also download the files onto your computer and copy them from your desktop to your Hoffman 2.

3. You will move the sequences.fastq.gz and barcodes.fastq.gz into a directory called emp-single-end-sequences that you create within your main directory. If you need further help you can look at the expected directory structure in directory called masterdir on this github.

4. You can use nano to copy and paste the master script called master.sh, which is in the directory masterscript on this github, into a bash script on your terminal

5. From here you can now just enter the following command:

```{bash}
sh master.sh -i emp-single-end-sequences/ -o output-emp-single-end-sequences -m sample-metadata.tsv -x demultiplex-sequences/ -v visuals/ -a dada2/ -t table-dada2/ -s stats-dada2/ -n aligned-sequences/ -u unrooted-tree/ -r rooted-tree/ -c core-metrics-results/
```

6. The program will begin making directories, making and saving different files, and comment as it proceeds to do so

7. In order to view the visulas generated (.qzv) files you will have to copy them on to your desktop and then drag and drop them onto QIIME2 View (https://view.qiime2.org)

### Expected Ouputs:
The following directories are expected to be outputs in one master directory:

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

core-metrics-results <br>  
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

1. Sullam, K. E., Essinger, S. D., Lozupone, C. A., O’Connor, M. P., Rosen, G. L., Knight, R., … Russell, J. A. (2012). Environmental and ecological factors that shape the gut bacterial communities of fish: A meta-analysis. Molecular Ecology, 21(13), 3363–3378. https://doi.org/10.1111/j.1365-294X.2012.05552.x
2. Bellwood, D.R., Hughes, T.P., Folke, C., & Nyström, M. (2004). Confronting the coral reef crisis. Nature, 429(6994), 827-833.
3. QIIME2 development team. 2016-2019. “Moving Pictures” tutorial. QIIME2 docs. <https://docs.qiime2.org/2019.4/tutorials/moving-pictures/>
4. Bolyen E, Rideout JR, Dillon MR, Bokulich NA, Abnet C, Al-Ghalith GA, Alexander H, Alm EJ, Arumugam M, Asnicar F, Bai Y, Bisanz JE, Bittinger K, Brejnrod A, Brislawn CJ, Brown CT, Callahan BJ, Caraballo-Rodríguez AM, Chase J, Cope E, Da Silva R, Dorrestein PC, Douglas GM, Durall DM, Duvallet C, Edwardson CF, Ernst M, Estaki M, Fouquier J, Gauglitz JM, Gibson DL, Gonzalez A, Gorlick K, Guo J, Hillmann B, Holmes S, Holste H, Huttenhower C, Huttley G, Janssen S, Jarmusch AK, Jiang L, Kaehler B, Kang KB, Keefe CR, Keim P, Kelley ST, Knights D, Koester I, Kosciolek T, Kreps J, Langille MG, Lee J, Ley R, Liu Y, Loftfield E, Lozupone C, Maher M, Marotz C, Martin BD, McDonald D, McIver LJ, Melnik AV, Metcalf JL, Morgan SC, Morton J, Naimey AT, Navas-Molina JA, Nothias LF, Orchanian SB, Pearson T, Peoples SL, Petras D, Preuss ML, Pruesse E, Rasmussen LB, Rivers A, Robeson, II MS, Rosenthal P, Segata N, Shaffer M, Shiffer A, Sinha R, Song SJ, Spear JR, Swafford AD, Thompson LR, Torres PJ, Trinh P, Tripathi A, Turnbaugh PJ, Ul-Hasan S, van der Hooft JJ, Vargas F, Vázquez-Baeza Y, Vogtmann E, von Hippel M, Walters W, Wan Y, Wang M, Warren J, Weber KC, Williamson CH, Willis AD, Xu ZZ, Zaneveld JR, Zhang Y, Zhu Q, Knight R, Caporaso JG. 2018. QIIME 2: Reproducible, interactive, scalable, and extensible microbiome data science. PeerJ Preprints 6:e27295v2 https://doi.org/10.7287/peerj.preprints.27295v2
5. Python Software Foundation. Python Language Reference, version 2.7. Available at <http://www.python.org>
6. Anaconda Software Distribution. Computer software. Vers. 2-2.4.0. Anaconda, Nov. 2016. Web. <https://anaconda.com> 
