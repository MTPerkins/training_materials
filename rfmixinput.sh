#!/bin/bash -l
#SBATCH -D /home/mtperkin/projects/Browning
#SBATCH -J rfmixinput
#SBATCH -o /home/mtperkin/projects/Browning/slurm-log/rfmixinput-%A_%a.out
#SBATCH -e /home/mtperkin/projects/Browning/slurm-log/rfmixinput-%A_%a.error
#SBATCH -t 04:00:00
#SBATCH -n 2
#SBATCH -p bigmemm
#SBATCH --mem=16G

for i in `seq 30`; do
  zcat results/chrom${i}_phased.vcf.gz | grep -v '#' | cut -f10- | tr -d '\t|' > results/chrom${i}.alleles_all
  cut -c1-600 results/chrom${i}.alleles_all > results/chrom${i}.alleles_ref
  cut -c601-1600 results/chrom${i}.alleles_all > results/chrom${i}.alleles_adm 
  paste results/chrom${i}.alleles_adm results/chrom${i}.alleles_ref | tr -d '\t' > results/chrom${i}.alleles
  rm results/chrom${i}.alleles_*
  cat data/constrecomb.txt | grep -i "^${i}[[:space:]]" | cut -d' ' -f4 > results/chrom${i}.mapcol1
  cat data/constrecomb.txt | grep -i "^${i}[[:space:]]" | cut -d' ' -f3 > results/chrom${i}.mapcol2
  paste results/chrom${i}.mapcol1 results/chrom${i}.mapcol2 > results/chrom${i}.2colmap
  zcat results/chrom${i}_phased.vcf.gz | grep -v '#' | cut -f2 | java -jar base2genetic.jar 1 results/chrom${i}.2colmap > results/chrom${i}.snploc
  rm results/chrom${i}.*map*
done
