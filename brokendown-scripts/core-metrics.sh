#!/bin/bash

Rooted=""
Tab=""
Met=""
Core=""

while getopts "r:t:m:c:" opt; do
	case $opt in
		r) Rooted="$OPTARG"
		;;
		t) Tab="$OPTARG"
		;;
		m) Met="$OPTARG"
		;;
		c) Core="$OPTARG"
	esac
done
source /u/local/Modules/default/init/bash
module load python/anaconda2
source activate qiime2-2019.1

qiime diversity core-metrics-phylogenetic \
  --i-phylogeny ${Rooted}/rooted-tree.qza \
  --i-table ${Tab}/table.qza \
  --p-sampling-depth 1103 \
  --m-metadata-file ${Met} \
  --output-dir ${Core}
