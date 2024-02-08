#!/bin/bash
#SBATCH --job-name=slab1
#SBATCH --account=project_2008684
#SBATCH --time=01:00:00
#SBATCH --partition=small
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

set -o errexit

module load gromacs-env

### For each CoM distance:

# Prepare equilibration
gmx_mpi grompp -c dimer1.pdb -f equil.mdp -p -n -o dimer01_equil.tpr

# Run equilibration
srun gmx_mpi mdrun -deffnm dimer01_equil -dlb auto

# Prepare umbrella data collection
gmx_mpi grompp -c dimer01_equil.gro -f umbrella.mdp -p -n -o umbrella01.tpr

# Run data collection
srun gmx_mpi mdrun -deffnm umbrella01

### Once all CoM distances done

# Run WHAM 
gmx_mpi wham -temp 300 -bins nbins -it your_tpr_files.dat -ix your_distance_files.dat -hist histograms.xvg -o surface.xvg
