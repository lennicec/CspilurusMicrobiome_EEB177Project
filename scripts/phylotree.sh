#!/bin/bash

Dada=""
Aligned=""
Unrooted=""
Rooted=""

while getopts "d:n:u:r:" opt; do
	case $opt in
		d) Dada="$OPTARG"
		;;
		n) Aligned="$OPTARG"
		;;
		u) Unrooted="$OPTARG"
		;;
		r) Rooted="$OPTARG"
	esac
done
source /u/local/Modules/default/init/bash
module load python/anaconda2
source activate qiime2-2019.1

mkdir aligned-sequences
mkdir unrooted-tree
mkdir rooted-tree

qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences ${Dada}/rep-seqs.qza \
  --o-alignment ${Aligned}/aligned-rep-seqs.qza \
  --o-masked-alignment ${Aligned}/masked-aligned-rep-seqs.qza \
  --o-tree ${Unrooted}/unrooted-tree.qza \
  --o-rooted-tree ${Rooted}/rooted-tree.qza
