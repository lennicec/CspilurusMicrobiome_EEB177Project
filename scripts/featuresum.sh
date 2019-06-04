#!/bin/bash

Tab=""
Vis=""	
Met=""
Dada=""

while getopts "t:v:m:d:" opt; do
	case $opt in
		t) Tab="$OPTARG"
		;;
		v) Vis="$OPTARG"
		;;
		m) Met="$OPTARG"
		;;
		d) Dada="$OPTARG"
	esac
done
source /u/local/Modules/default/init/bash
module load python/anaconda2
source activate qiime2-2019.1

qiime feature-table summarize \
  --i-table ${Tab}/table.qza \
  --o-visualization ${Vis}/table.qzv \
  --m-sample-metadata-file ${Met}
qiime feature-table tabulate-seqs \
  --i-data ${Dada}/rep-seqs.qza \
  --o-visualization ${Vis}/rep-seqs.qzv
