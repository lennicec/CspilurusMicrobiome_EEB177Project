#!/bin/bash

In=""
Out=""
Met=""
Demux=""
Vis=""

while getopts "i:o:m:x:v:" opt; do
	case $opt in
		i) In="$OPTARG"
		;;
		o) Out="$OPTARG"
		;;
		m) Met="$OPTARG"
        ;;
        x) Demux="$OPTARG"
        ;;
        v) Vis="$OPTARG"
	esac
done
source /u/local/Modules/default/init/bash
module load python/anaconda2
source activate qiime2-2019.1

echo "Making directory called output-emp-single-end-sequences"

mkdir output-emp-single-end-sequences

echo "Using sequences.fastq.gz and barcodes.fastq.gz to make emp-single-end-sequences.qza to put in output-emp-single-end-sequences directory"

qiime tools import \
  --type EMPSingleEndSequences \
  --input-path ${In} \
  --output-path ${Out}/emp-single-end-sequences.qza
  
echo "Making directory called demultiplex-sequences"

mkdir demultiplex-sequences

echo "Generating demux.qza file where samples are assigned their proper sequence (goes in demultiplex-sequences directory"

qiime demux emp-single \
  --i-seqs ${Out}/emp-single-end-sequences.qza \
  --m-barcodes-file ${Met} \
  --m-barcodes-column BarcodeSequence \
  --o-per-sample-sequences ${Demux}/demux.qza
  
echo "Making directory called visuals"
  
mkdir visuals

echo "Generating a visual friendly version called demultiplex-sequences"

qiime demux summarize \
  --i-data ${Demux}/demux.qza \
  --o-visualization ${Vis}/demux.qzv

