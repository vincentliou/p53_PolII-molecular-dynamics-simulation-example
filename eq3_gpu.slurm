#!/bin/bash -l

#SBATCH -J eq3_comp
#SBATCH -p gpu
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH --mem=16000
#SBATCH --gres=gpu:1

module load cuda/9.0

source /home/phynt92/amber16/amber.sh

pmemd.cuda -O -i eq3.in -o eq3.out -c eq2.restrt -p p53_polII2.prmtop -r eq3.restrt -inf mdinfo -x eq3.mdcrd -ref eq2.restrt
wait
sbatch eq4_gpu.slurm
