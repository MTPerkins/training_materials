#!/bin/bash -l
#SBATCH -D /home/mtperkin/projects/Browning
#SBATCH -J listadmixed
#SBATCH -o /home/mtperkin/projects/Browning/slurm-log/lsadmixed-%A_%a.out
#SBATCH -e /home/mtperkin/projects/Browning/slurm-log/lsadmixed-%A_%a.error
#SBATCH -t 24:00:00
#SBATCH -n 8
#SBATCH -p bigmemm
#SBATCH --mem=64G

rm results/admids
for j in `seq 300 799`; do echo msp_$j >> results/admids; done
