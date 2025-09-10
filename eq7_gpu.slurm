#!/bin/bash -l

#SBATCH -J eq7_comp
#SBATCH -p gpu
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH --mem=16000
#SBATCH --gres=gpu:1

module load cuda/9.0

source /home/phynt92/amber16/amber.sh

pmemd.cuda -O -i eq7.in -o eq7.out -c eq6.restrt -p p53_polII2.prmtop -r eq7.restrt -inf mdinfo -x eq7.mdcrd -ref eq6.restrt
wait
sbatch prod1_gpu.slurm


