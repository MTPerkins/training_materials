# training_materials
scripts adapted from Browning et al. (2018) Ancestry-specific recent Ne in the Americas. Plos Genet

Scripts should be run in this order:
   Script - Software - task
1) beagle1.sh - Beagle - phasing and IBD segment detection (note: these two tasks are both performed in Beagle in the version I've installed, but in newer versions of Beagle, RefinedIBD as standalone program for IBD detection)
2) gapfill.sh - merge jar file - merge gaps in IBD
3) rfmixinput.sh - base2genetic.jar - reorder data to put admixed chromosomes first in data
4) rfmixclasses.sh - n/a - make RFMix classes file
5)
6)
7)
8)
