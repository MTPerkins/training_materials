# training_materials
scripts adapted from Browning et al. (2018) Ancestry-specific recent Ne in the Americas. Plos Genet

Scripts were run in the order listed below. Details are provided in the format: script - software - task

1) beagle1.sh - Beagle - phasing and IBD segment detection (note: these two tasks are both performed in Beagle in the version I've installed, but in newer versions of Beagle, RefinedIBD is standalone program for IBD detection)
2) gapfill.sh - merge jar file - merge gaps in IBD
3) rfmixinput.sh - base2genetic.jar - reorder data to put admixed chromosomes first in data
4) rfmixclasses.sh - n/a - make RFMix classes file
5) rfmix.sh - RFMix - estimates local ancestry
6) listadmixed.sh - n/a - make list of admixed ids
7) rephaseRFMoutput.sh - rephasevit.py script - rephases the RFMix output to match the original phasing
8) popfilterputanc.sh - filter_gapfilled_ibd_ancestry.py script - filter on population and put in the ancestry
9) combinechromo.sh - n/a - combine data from the different chromosomes
10) calchaplopairs.sh - filtercolumns.jar and adjust_npairs.py - calculate adjusted numbers of pairs of haplotypes
11) ibdne.sh - IBDNe - estimate Ne for the different ancestries
12) Rscript_reproduce_Fig1_Browning - R - plot Ne
