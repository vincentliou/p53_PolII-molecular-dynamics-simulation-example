#!/bin/bash -l
#SBATCH -J cluster
#SBATCH -p high
#SBATCH -N 1
#SBATCH -n 2
#SBATCH -t 200:00:00
#SBATCH --mem=16000

source /home/leeping/opt/amber/amber.sh

cpptraj p53_polII2.prmtop < traj_rewion.in > cpptraj_cluster.log
