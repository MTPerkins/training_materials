#!/bin/bash -l
#SBATCH -D /home/mtperkin/projects/Browning
#SBATCH -J rephase
#SBATCH -o /home/mtperkin/projects/Browning/slurm-log/rephase-%A_%a.out
#SBATCH -e /home/mtperkin/projects/Browning/slurm-log/rephase-%A_%a.error
#SBATCH -t 24:00:00
#SBATCH -n 8
#SBATCH -p bigmemm
#SBATCH --mem=64G

for i in `seq 30`; do
	python rephasevit.py results/chrom${i}_phased.vcf.gz results/admids results/chrom${i}_rfmix.allelesRephased0.txt results/chrom${i}_rfmix.0.Viterbi.txt > results/chrom${i}_rfmix_Viterbi_refinedibdphase
	rm results/chrom${i}_rfmix.*
done
