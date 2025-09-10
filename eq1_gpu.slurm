#!/bin/bash -l

#SBATCH -J eq1_comp
#SBATCH -p gpu
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH --mem=16000
#SBATCH --gres=gpu:1

module load cuda/9.0

source /home/phynt92/amber16/amber.sh

pmemd.cuda -O -i eq1.in -o eq1.out -c heat1.restrt -p p53_polII2.prmtop -r eq1.restrt -inf mdinfo -x eq1.mdcrd -ref heat1.restrt
wait
sbatch eq2_gpu.slurm
