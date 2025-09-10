#!/bin/bash -l

#SBATCH -J eq4_comp
#SBATCH -p gpu
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH --mem=16000
#SBATCH --gres=gpu:1

module load cuda/9.0

source /home/phynt92/amber16/amber.sh

pmemd.cuda -O -i eq4.in -o eq4.out -c eq3.restrt -p p53_polII2.prmtop -r eq4.restrt -inf mdinfo -x eq4.mdcrd -ref eq3.restrt
wait
sbatch eq5_gpu.slurm
