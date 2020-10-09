from time import perf_counter
from random import random

N = 10_000
cpu_runs = 5

times = []
x = [random() for _ in range(N)]
for k in range(cpu_runs):
  min_dx = k
  t0 = perf_counter()
  for i in range(N - 1):
    for j in range(i + 1, N):
      dx = abs(x[i] - x[j])
      if dx < min_dx: min_dx = dx
  times.append(perf_counter() - t0)
print(min(times))
