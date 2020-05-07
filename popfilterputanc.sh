#!/bin/bash -l
#SBATCH -D /home/mtperkin/projects/Browning
#SBATCH -J popfilterputancestry
#SBATCH -o /home/mtperkin/projects/Browning/slurm-log/putanc-%A_%a.out
#SBATCH -e /home/mtperkin/projects/Browning/slurm-log/putanc-%A_%a.error
#SBATCH -t 24:00:00
#SBATCH -n 8
#SBATCH -p bigmemm
#SBATCH --mem=64G

nanc=3
for i in `seq 30`; do
	python filter_gapfilled_ibd_ancestry.py results/chrom${i}_phased.ibd results/chrom${i}_filled.ibd results/chrom${i}${x}_rfmix_Viterbi_refinedibdphase $nanc > results/chrom${i}_allanc.gapfilled_ibd
    for anc in 1 2 3; do
	cat results/chrom${i}_allanc.gapfilled_ibd | grep -i "[[:space:]]${anc}"'$' | cut -f1-8 -d' ' > results/chrom${i}_anc${anc}.gapfilled_ibd
      done
done
