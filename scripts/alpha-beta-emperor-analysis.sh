#!/bin/bash

Core=""
Met=""
Vis=""

while getopts "c:m:v:" opt; do
	case $opt in
		c) Core="$OPTARG"
		;;
		m) Met="$OPTARG"
		;;
		v) Vis="$OPTARG"
	esac
done
source /u/local/Modules/default/init/bash
module load python/anaconda2
source activate qiime2-2019.1

qiime diversity alpha-group-significance \
  --i-alpha-diversity ${Core}/faith_pd_vector.qza \
  --m-metadata-file ${Met} \
  --o-visualization ${Vis}/faith-pd-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity ${Core}/evenness_vector.qza \
  --m-metadata-file ${Met} \
  --o-visualization ${Vis}\evenness-group-significance.qzv

qiime diversity beta-group-significance \
  --i-distance-matrix ${Core}/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file ${Met} \
  --m-metadata-column BodySite \
  --o-visualization ${Vis}/unweighted-unifrac-body-site-significance.qzv \
  --p-pairwise

qiime diversity beta-group-significance \
  --i-distance-matrix ${Core}/unweighted_unifrac_distance_matrix.qza \
  --m-metadata-file ${Met} \
  --m-metadata-column Subject \
  --o-visualization ${Vis}/unweighted-unifrac-subject-group-significance.qzv \
  --p-pairwise

qiime emperor plot \
  --i-pcoa ${Core}/unweighted_unifrac_pcoa_results.qza \
  --m-metadata-file ${Met} \
  --p-custom-axes DaysSinceExperimentStart \
  --o-visualization ${Vis}/unweighted-unifrac-emperor-DaysSinceExperimentStart.qzv

qiime emperor plot \
  --i-pcoa core-metrics-results/bray_curtis_pcoa_results.qza \
  --m-metadata-file sample-metadata.tsv \
  --p-custom-axes DaysSinceExperimentStart \
  --o-visualization ${Vis}/bray-curtis-emperor-DaysSinceExperimentStart.qzv
