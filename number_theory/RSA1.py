
import math

def gcd(a, b):
    temp = 0
    while(1):
        temp = a % b
        if (temp == 0):
            return b
        a = b
        b = temp
 
p = 3
q = 7
n = p*q
e = 2
phi = (p-1)*(q-1)

while (e < phi):
 
    if(gcd(e, phi) == 1):
        break
    else:
        e = e+1
 
k = 2
d = (1 + (k*phi))/e


message = 10
print("      ")
print("            RSA ALGORITHM")
print("Message           : ", message)
 
c = pow(message,e)
c = math.fmod(c, n)

print("Encrypted Message : ", c)
m = pow(c,d)
m = math.fmod(m, n)

print("Decrypted Message : ", m)
print("      ")