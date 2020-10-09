from mpi4py import MPI
from time import perf_counter

def compute2():
  import numpy as np
  import scipy as sp
  from scipy.linalg import lu
  N = 10_000
  X = np.random.randn(N, N)
  t0 = perf_counter()
  p, l, u = lu(X, check_finite=False)
  return perf_counter() - t0

def compute1():
  from random import random
  N = 20_000
  x = [random() for _ in range(N)]
  t0 = perf_counter()
  min_dx=1e308
  for i in range(N - 1):
    for j in range(i + 1, N):
      dx = abs(x[i] - x[j])
      if dx < min_dx: min_dx = dx
  return perf_counter() - t0

if __name__ == "__main__":
  t0 = perf_counter()
  size = MPI.COMM_WORLD.Get_size()
  rank = MPI.COMM_WORLD.Get_rank()
  name = MPI.Get_processor_name()
  mytime = compute2()
  times = MPI.COMM_WORLD.gather(mytime, root=0)
  if (rank == 0): print(min(times), times)
  if (rank == 0): print("<overall>", perf_counter() - t0, ", <N>", size)
