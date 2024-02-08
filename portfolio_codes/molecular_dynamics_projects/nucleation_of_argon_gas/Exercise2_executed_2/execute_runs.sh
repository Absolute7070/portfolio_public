#!/bin/bash
# executing each run.sh in each folders 

cd ..
chmod -R u+x Exercise2      # s.t. we can execute our .sh scripts 
cd Exercise2             # move to the folder to start with 

cd 12.5nm
sbatch run.sh
cd ..
cd 11nm
sbatch run.sh
cd ..
cd 10.5nm
sbatch run.sh
cd ..
cd 14nm
sbatch run.sh
cd ..
cd 12nm
sbatch run.sh
cd ..
cd 13.5nm
sbatch run.sh
cd ..
cd 14.5nm
sbatch run.sh
cd ..
cd 13nm
sbatch run.sh
cd ..
cd 11.5nm
sbatch run.sh
cd ..
