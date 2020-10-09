#!/bin/bash
#SBATCH --job-name=myjob         # create a short name for your job
#SBATCH --output=slurm-xxx-%j.out
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
# SBATCH --ntasks-per-socket=1
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=7G         # memory per cpu-core (4G per cpu-core is default)
#SBATCH --time=00:05:00          # total run time limit (HH:MM:SS)
#SBATCH --exclude=tiger-i25c1n21

hostname

module purge
module load anaconda3

numactl -s
taskset -c -p $$

numactl -H

numactl --membind=1 python nested.py
