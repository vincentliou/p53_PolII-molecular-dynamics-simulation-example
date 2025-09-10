#!/bin/bash -l

#SBATCH -J eq2_comp
#SBATCH -p gpu
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH --mem=16000
#SBATCH --gres=gpu:1

module load cuda/9.0

source /home/phynt92/amber16/amber.sh

pmemd.cuda -O -i eq2.in -o eq2.out -c eq1.restrt -p p53_polII2.prmtop -r eq2.restrt -inf mdinfo -x eq2.mdcrd -ref eq1.restrt
wait
sbatch eq3_gpu.slurm
