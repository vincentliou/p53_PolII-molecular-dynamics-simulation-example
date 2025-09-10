#!/bin/bash -l

#SBATCH -J eq6_comp
#SBATCH -p gpu
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH --mem=16000
#SBATCH --gres=gpu:1

module load cuda/9.0

source /home/phynt92/amber16/amber.sh

pmemd.cuda -O -i eq6.in -o eq6.out -c eq5.restrt -p p53_polII2.prmtop -r eq6.restrt -inf mdinfo -x eq6.mdcrd -ref eq5.restrt
wait
sbatch eq7_gpu.slurm
