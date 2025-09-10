#!/bin/bash -l

#SBATCH -J heat_comp
#SBATCH -p gpu
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH --mem=15000
#SBATCH --gres=gpu:1

module load cuda/9.0

source /home/phynt92/amber16/amber.sh

pmemd.cuda -O -i heat1.in -o heat1.out -c min2.restrt -p p53_polII2.prmtop -r heat1.restrt -inf mdinfo -x md_heat.mdcrd -ref min2.restrt
wait
sbatch eq1_gpu.slurm

