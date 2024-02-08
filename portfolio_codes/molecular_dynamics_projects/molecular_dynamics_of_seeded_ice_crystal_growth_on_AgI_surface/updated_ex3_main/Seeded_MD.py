import numpy as np

kb = 1.38e-23
T = 240 # You need to find this out using seeded MD
theta = 1.2616985 # contact angle in radians

def f(theta):
    return 0.5 + 0.75*np.cos(theta) + 0.24*np.power(np.cos(theta),3)

def gamma_icewater(T):
    return 0.0208 * np.power(T / 235.8, 0.3)

def partialpwat(T):
    arg = 54.84276
    arg -= 6763.22/T
    arg -= 4.210*np.log(T)
    arg += T*3.67e-4

    arg2 = 53.878
    arg2 -= 1331.22/T
    arg2 -= 9.44523*np.log(T)
    arg2 += 0.014025*T
    return np.exp(arg+arg2*np.tanh(0.0415*(T-218.8)))

def partialpice(T):
    arg = 9.550426
    arg -= 5723.265/T
    arg += 3.53068*np.log(T)
    arg -= T*7.28332e-3
    return np.exp(arg)

def mu(T): 
    return -kb*T*np.log(partialpice(T)/partialpwat(T))
