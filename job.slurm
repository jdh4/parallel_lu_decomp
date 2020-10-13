#!/bin/bash
#SBATCH --job-name=cxx_mpi       # create a short name for your job
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=128
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=1G         # memory per cpu-core (4G is default)
#SBATCH --time=00:10:00          # total run time limit (HH:MM:SS)

hostname

module purge
module load openmpi/gcc/4.0.4/64

for i in 1 2 4 8 16 32 64 128
do
  echo N $i
  time srun -n $i ./lu
done
