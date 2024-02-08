#!/bin/bash
#SBATCH --job-name=slab1
#SBATCH --account=project_2008684
#SBATCH --time=01:00:00
#SBATCH --partition=small
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

set -o errexit

module load gromacs-env


gmx_mpi grompp -f nvt_240.mdp -c minimized.gro -p topol.top -n index2.ndx -o 240nvt.tpr
srun gmx_mpi mdrun -v -deffnm 240nvt
    
gmx_mpi grompp -f nvt_245.mdp -c minimized.gro -p topol.top -n index2.ndx -o 245nvt.tpr
srun gmx_mpi mdrun -v -deffnm 245nvt
    
gmx_mpi grompp -f nvt_250.mdp -c minimized.gro -p topol.top -n index2.ndx -o 250nvt.tpr
srun gmx_mpi mdrun -v -deffnm 250nvt
    
gmx_mpi grompp -f nvt_255.mdp -c minimized.gro -p topol.top -n index2.ndx -o 255nvt.tpr
srun gmx_mpi mdrun -v -deffnm 255nvt
    
gmx_mpi grompp -f nvt_260.mdp -c minimized.gro -p topol.top -n index2.ndx -o 260nvt.tpr
srun gmx_mpi mdrun -v -deffnm 260nvt
    
gmx_mpi grompp -f nvt_265.mdp -c minimized.gro -p topol.top -n index2.ndx -o 265nvt.tpr
srun gmx_mpi mdrun -v -deffnm 265nvt
    