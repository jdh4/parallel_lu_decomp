#!/bin/bash
#SBATCH --job-name=myjob         # create a short name for your job
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=40              # total number of tasks across all nodes
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem=190G
#SBATCH --time=00:05:00          # total run time limit (HH:MM:SS)
#SBATCH --exclude=tiger-h19c2n5

hostname

module purge
module load anaconda3 openmpi/gcc/3.1.5/64
conda activate fast-mpi4py

OMP_NUM_THREADS=1 srun python myscript.py
