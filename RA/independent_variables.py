import numpy as np
from tabulate import tabulate

# E(X*Y) = E(X)*E(Y) if X and Y are independent
# random x[1-3] and y[4-6]
samples_x = np.random.randint(1,4,1000000)
samples_y = np.random.randint(4,7,1000000)

# product of x and y
product = samples_x*samples_y

# calculating expectation
E_x = np.mean(samples_x , axis=0)
E_y = np.mean(samples_y , axis=0)
E_p = np.mean(product , axis=0)
P_xy = E_x*E_y


print("E(X)*E(Y) = ",P_xy)
print("E(X*Y) = ",E_p)

