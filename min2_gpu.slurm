#!/bin/bash -l

#SBATCH -J min2_comp
#SBATCH -p gpu
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 24:00:00
#SBATCH --mem=16000
#SBATCH --gres=gpu:1

module load cuda/9.0

source /home/phynt92/amber16/amber.sh

#sander -O -i min1.in -o min1.out -p complex_cd_bsl_k.prmtop -c complex_cd_bsl_k.inpcrd -ref complex_cd_bsl_k.inpcrd -r min1.rst


pmemd.cuda -O -i min2.in -o min2.out -c min1.restrt -p p53_polII2.prmtop -r min2.restrt -inf mdinfo -x min2.mdcrd -ref min1.restrt
wait
sbatch heat_gpu.slurm





