#!/bin/bash

x=15 # nm

export OMP_NUM_THREADS=${SLURM_CPUS_PER_TASK}

# run packmol
chmod a+x packmol
./packmol < ar8192.inp

# convert to gro and add pbc
gmx_mpi editconf -f $((x))nm.pdb -box $x $x $x -o $((x))nm.gro

# prepare energy minimization
gmx_mpi grompp -f steep.mdp -c $((x))nm.gro -p LJ8192.top -o $((x))nm_steep.tpr

# run energy minimization
srun gmx_mpi mdrun -s -deffnm $((x))nm_steep

# prepare NVT simulation
gmx_mpi grompp -f NVT.mdp -c $((x))nm_steep.gro -p LJ8192.top -o $((x))nm_8192.tpr

# run NVT simulation
srun gmx_mpi mdrun -s -deffnm $((x))nm_8192 -ntomp $OMP_NUM_THREADS

x=10 # nm

# do it all again...

# analyse spinodal
gmx_mpi density -f $((x))nm_8192 ...
