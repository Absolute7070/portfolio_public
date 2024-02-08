#!/bin/bash
#SBATCH --job-name=slab1
#SBATCH --account=project_2008684
#SBATCH --time=20:00:00
#SBATCH --partition=small
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

set -o errexit

module load gromacs-env

export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}



gmx_mpi grompp -f nvt_220.mdp -c minimized.gro -p topol.top -n index2.ndx -o 220nvt.tpr
srun gmx_mpi mdrun -v -deffnm 220nvt -ntomp $OMP_NUM_THREADS
