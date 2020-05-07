#!/bin/bash -l
#SBATCH -D /home/mtperkin/projects/Browning
#SBATCH -J combinechromo
#SBATCH -o /home/mtperkin/projects/Browning/slurm-log/combchrom-%A_%a.out
#SBATCH -e /home/mtperkin/projects/Browning/slurm-log/combchrom-%A_%a.error
#SBATCH -t 24:00:00
#SBATCH -n 8
#SBATCH -p bigmemm
#SBATCH --mem=64G

for anc in 1 2 3; do
  cat results/chrom[1-9]_anc${anc}.gapfilled_ibd results/chrom[1-3][0-9]_anc${anc}.gapfilled_ibd > results/anc${anc}.gapfilled_ibd
done
