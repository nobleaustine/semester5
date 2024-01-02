import numpy as np
from tabulate import tabulate

# unbiased estimator of population mean (µ): sample mean(a)
# E(a)= µ

# creating a 10000 samples of of 8 from [0,4]
samples = np.random.randint(0,5,(10000,8))
# average mean of each sample
A = np.mean(samples, axis=1)

# tabulating
table = np.column_stack((samples,A))
title = []
for i in range(1,9):
    title.append("X"+str(i))
title = title + ["sample_mean"]

# population_mean = E(A)
population_mean = np.mean(A,axis=0)

# printing results
print(" ")
print(tabulate(table[0:5,:],headers=title, tablefmt='plain'))
print(" ")
print("actual population mean     : 2")
print("calculated population mean : ",population_mean)
print(" ")
