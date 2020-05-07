#!/bin/bash -l
#SBATCH -D /home/mtperkin/projects/Browning
#SBATCH -J calchaplopairs
#SBATCH -o /home/mtperkin/projects/Browning/slurm-log/calchaplo-%A_%a.out
#SBATCH -e /home/mtperkin/projects/Browning/slurm-log/calchaplo-%A_%a.error
#SBATCH -t 24:00:00
#SBATCH -n 8
#SBATCH -p bigmemm
#SBATCH --mem=64G

for anc in 1 2 3; do
  cat results/chrom[1-9]_rfmix_Viterbi_refinedibdphase results/chrom[1-3][0-9]_rfmix_Viterbi_refinedibdphase | java -jar filtercolumns.jar 1 results/admids | python adjust_npairs.py $anc > results/anc${anc}_npairs
done
