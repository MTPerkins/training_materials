#!/bin/bash -l
#SBATCH -D /home/mtperkin/projects/Browning
#SBATCH -J ibdne
#SBATCH -o /home/mtperkin/projects/Browning/slurm-log/ibdne-%A_%a.out
#SBATCH -e /home/mtperkin/projects/Browning/slurm-log/ibdne-%A_%a.error
#SBATCH -t 24:00:00
#SBATCH -n 12
#SBATCH -p bigmemm
#SBATCH --mem=96G

cm=2
for anc in 1 2 3; do
  cat results/anc${anc}.gapfilled_ibd | java -jar ibdne.23Apr20.ae9.jar map=data/constrecomb.txt nthreads=12 mincm=$cm npairs=`cat results/anc${anc}_npairs` filtersamples=false out=results/anc${anc}_${cm}cM.ibdne 
done
