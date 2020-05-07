#!/bin/bash -l
#SBATCH -D /home/mtperkin/projects/Browning
#SBATCH -J beagle1
#SBATCH -o /home/mtperkin/projects/Browning/slurm-log/beagle-%A_%a.out
#SBATCH -e /home/mtperkin/projects/Browning/slurm-log/beagle-%A_%a.error
#SBATCH -t 60:00:00
#SBATCH -n 16
#SBATCH -p bigmemm
#SBATCH --mem=128G

for i in `seq 30`; do
	java -Xmx128000m -jar beagle.09Feb16.2b7.jar gt=data/chrom${i}_filtered.vcf.gz out=results/chrom${i}_phased nthreads=16 ibd=true
done
