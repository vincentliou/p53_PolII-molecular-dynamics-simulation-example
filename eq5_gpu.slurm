#!/bin/bash -l

#SBATCH -J eq5_comp
#SBATCH -p gpu
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH --mem=16000
#SBATCH --gres=gpu:1

module load cuda/9.0

source /home/phynt92/amber16/amber.sh

pmemd.cuda -O -i eq5.in -o eq5.out -c eq4.restrt -p p53_polII2.prmtop -r eq5.restrt -inf mdinfo -x eq5.mdcrd -ref eq4.restrt
wait
sbatch eq6_gpu.slurm
