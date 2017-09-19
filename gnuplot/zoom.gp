set print "-"

zmin = 1.0
zmax = 40.0
N = 2.0
L = 1.0

A = (zmin**2 * (N-1)**2)/(zmax - zmin - 2*zmin*(N-1))
B = 2.0/L * log((zmin*(N-1))/A+1)
C = zmin - A

zoom(x) = A * exp(B * x) + C

print zoom(0)
print zoom(L/2.0)
print zoom(L)

plot [0:1] zoom(x)

