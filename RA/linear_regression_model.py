import numpy as np
from tabulate import tabulate

# taking inputs and title
print(" ")
print("       Linear Regression Model ")
print(" ")
x = input("Enter X as space separated values : ")
y = input("Enter Y as space separated values : ")

# converting to numpy and calculating X*Y and X*X
X = np.array([float(value) for value in x.split(" ")])
Y = np.array([float(value) for value in y.split(" ")])
n = len(X)

title = ["X","Y","XY","X^2","Y^2"]
table = np.column_stack((X,Y))
new_column = X*Y
table = np.column_stack((table,new_column))
new_column = X*X
table = np.column_stack((table,new_column))
new_column = Y*Y
table = np.column_stack((table,new_column))
# 12 30 36 40 45 57 62 67 71 78 93 94 100 105
# 33 32 34 30 28 29 27 26 25 26 22 20 23 21
# calcualting componets of equation
ΣX = np.sum(table[:,0])
ΣY = np.sum(table[:,1])
ΣXY = np.sum(table[:,2])
ΣX_2 = np.sum(table[:,3])
ΣY_2 = np.sum(table[:,4])

new_row = np.sum(table,axis=0)
print(new_row)
table = np.row_stack((table,new_row))

β1 = round((n*ΣXY - ΣX*ΣY)/(n*ΣX_2 - ΣX*ΣX),5)
β0 = round((ΣY-ΣX*β1)/n,5)
SST = round(ΣY_2-(ΣY*ΣY/n),5)
SSE = round(ΣY_2-β0*ΣY-β1*ΣXY,5)

print(" ")
print(tabulate(table,headers=title,tablefmt="grid"))
print("Equation : Y = ",str(β0)," + ",str(β1),"*X")
print("SST : ",SST)
print("SSE : ",SSE)
print("R2 : ",1-(SSE/SST))
print(" ")
# evaluting the function
c =1
while c ==1 :
    x = float(input("Enter x for which y need to be calculated : "))
    print("y = ",β0 + β1*x )
    print(" ")
    c = int(input("Enter 1 to continue 0 to quit "))
    print(" ")



