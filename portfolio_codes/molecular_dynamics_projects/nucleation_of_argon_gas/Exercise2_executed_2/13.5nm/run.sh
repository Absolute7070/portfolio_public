#!/bin/bash
#SBATCH --job-name=slab1
#SBATCH --account=project_2008684
#SBATCH --time=01:00:00
#SBATCH --partition=small
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

set -o errexit

module load gromacs-env


x=13.5 # nm 
export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}



# convert to gro and add pbc
gmx_mpi editconf -f ${x}nm.pdb -box $x $x $x -o ${x}nm.gro

# prepare energy minimization
gmx_mpi grompp -f steep.mdp -c ${x}nm.gro -p LJ8192.top -o ${x}nm_steep.tpr

# run energy minimization
srun gmx_mpi mdrun -s -deffnm ${x}nm_steep

# prepare NVT simulation
gmx_mpi grompp -f NVT.mdp -c ${x}nm_steep.gro -p LJ8192.top -o ${x}nm_8192.tpr

# run NVT simulation
srun gmx_mpi mdrun -s -deffnm ${x}nm_8192 -ntomp $OMP_NUM_THREADS


# analyse spinodal
# gmx_mpi density -f ${x}nm_8192.gro -s ${x}nm_8192.tpr -d Y -sl 100 -o density_afterNVT.xvg

