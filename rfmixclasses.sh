#!/bin/bash -l
#SBATCH -D /home/mtperkin/projects/Browning
#SBATCH -J rfmixclasses
#SBATCH -o /home/mtperkin/projects/Browning/slurm-log/rfmixclasses-%A_%a.out
#SBATCH -e /home/mtperkin/projects/Browning/slurm-log/rfmixclasses-%A_%a.error
#SBATCH -t 2:00:00
#SBATCH -n 1
#SBATCH -p bigmemm
#SBATCH --mem=8G

for j in `seq 1000`; do echo "0" >> temp; done
for j in `seq 200`; do echo "1" >> temp; done
for j in `seq 200`; do echo "2" >> temp; done
for j in `seq 200`; do echo "3" >> temp; done
(cat temp | tr '\n' ' '; echo "") > results/classes 
rm temp
