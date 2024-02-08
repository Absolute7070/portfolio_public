import numpy as np

N_A = 6.022e23

# Eq 6 from Zobrist et al 2007
# doi.org/10.1021/jp066080w
def v_ice(T):
    Tr = (T-273.15)/273.15
    prefactor = 0.018/((N_A)*917)
    arg = 1
    arg -= 0.05294*Tr
    arg -= 0.05637*np.square(Tr)
    arg -= 0.002913*np.power(Tr,3)
    return prefactor/arg