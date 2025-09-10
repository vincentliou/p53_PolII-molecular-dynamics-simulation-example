#!/bin/bash -l
#SBATCH -J cluster
#SBATCH -p high
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 200:00:00
#SBATCH --mem=16000

source /home/leeping/opt/amber/amber.sh
#source /home/phynt92/amber16/amber.s

MMPBSA.py -O -i mmpbsa.in -o FINAL_RESULTS_MMPBSA2.dat -cp PIC2.prmtop -rp PIC_nop532.prmtop -lp p532.prmtop -y prod1_nw.mdcrd
