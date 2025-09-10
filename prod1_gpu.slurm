#!/bin/bash -l

#SBATCH -J prod1_comp
#SBATCH -p gpu
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 72:00:00
#SBATCH --mem=16000
#SBATCH --gres=gpu:1

module load cuda/9.0

source /home/phynt92/amber16/amber.sh


#sander -O -i min_restraint1.in -o min1.out -p complex_cd_bsl_k.prmtop -c complex_cd_bsl_k.inpcrd -ref complex_cd_bsl_k.inpcrd -r min1.rst


pmemd.cuda -O -i prod1.in -o prod1.out -p p53_polII2.prmtop -c eq7.restrt -r prod1.restrt -x prod1.mdcrd -ref eq7.restrt -inf mdinfo
wait



