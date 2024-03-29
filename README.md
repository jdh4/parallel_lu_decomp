# LU decomposition per MPI process (weak scaling)

This embarrassingly parallel code performs the same LU decomposition of a square matrix on each MPI process. Besides an insignificant gather at the end of the run, there is no communication between processes. The number of CPU-cores is varied while the work that each CPU-core does is fixed.

## Tiger

```
$ module purge
$ module load intel/19.0/64/19.0.5.281 intel-mpi/intel/2019.3/64
$ make
$ sbatch job.slurm
```

## Stellar-AMD

```
$ module purge
$ module load openmpi/gcc/4.1.0
$ make -f Makefile.stellar-amd
$ sbatch job.slurm
```

## Traverse

```
$ module purge
$ module load openmpi/gcc/4.0.4/64
$ make -f Makefile.traverse
$ sbatch job.slurm
```

![data](https://tigress-web.princeton.edu/~jdh4/lu_decomp_embarr_par_sept28_2020.png)
