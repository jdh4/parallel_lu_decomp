from time import perf_counter

import os
num_threads = int(os.environ['SLURM_CPUS_PER_TASK'])

import mkl
mkl.set_num_threads(num_threads)

import numpy as np
import scipy as sp
from scipy.linalg import lu

N = 10000
cpu_runs = 5

times = []
X = np.random.randn(N, N).astype(np.float64)
for _ in range(cpu_runs):
  t0 = perf_counter()
  p, l, u = lu(X, check_finite=False)
  times.append(perf_counter() - t0)
print("CPU time: ", min(times))
print("NumPy version: ", np.__version__)
print("SciPy version: ", sp.__version__)
print(p.sum())
print(times)
