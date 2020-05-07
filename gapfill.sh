#!/bin/bash -l
#SBATCH -D /home/mtperkin/projects/Browning
#SBATCH -J gapfill2
#SBATCH -o /home/mtperkin/projects/Browning/slurm-log/gapfill-%A_%a.out
#SBATCH -e /home/mtperkin/projects/Browning/slurm-log/gapfill-%A_%a.error
#SBATCH -t 4:00:00
#SBATCH -n 1
#SBATCH -p bigmemm
#SBATCH --mem=8G

for i in `seq 30`; do
  cat results/chrom${i}_phased.ibd | java -jar merge-ibd-segments.17Jan20.102.jar results/chrom${i}_phased.vcf.gz data/constrecomb.txt 0.6 1 > results/chrom${i}_filled.ibd 
done
