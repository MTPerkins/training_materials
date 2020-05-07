#!/bin/bash -l
#SBATCH -D /home/mtperkin/projects/Browning
#SBATCH -J RFMix
#SBATCH -o /home/mtperkin/projects/Browning/slurm-log/rfmix-%A_%a.out
#SBATCH -e /home/mtperkin/projects/Browning/slurm-log/rfmix-%A_%a.error
#SBATCH -t 72:00:00
#SBATCH -n 8
#SBATCH -p bigmemm
#SBATCH --mem=64G

for i in `seq 30`; do
	./run_rfmix results/chrom${i}.alleles results/classes results/chrom${i}.snploc results/chrom${i}_rfmix
done
