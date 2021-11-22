#!/usr/bin/env python3

""" This script can generate two figures about Consumer-Resource population dynamics for the Lotka-Volterra (LV) model. """

__appname__ = '[application name here]'
__author__ = 'Junyue (jz1621@ic.ac.uk)'
__version__ = '0.0.1'
__license__ = "License for this code/program"


## imports ##
import numpy as np
import matplotlib.pylab as p
import scipy.integrate as integrate
from matplotlib.backends.backend_pdf import PdfPages


## define a function that returns the growth rate of consumer and resource population at any given time step ##
def dCR_dt(pops, t=0):

    """Return the growth rate of consumer and resource population at any given time step."""
    R = pops[0]
    C = pops[1]
    dRdt = r * R - a * R * C 
    dCdt = -z * C + e * a * R * C
    
    return np.array([dRdt, dCdt])


## assign some parameter values ##
r = 1.
a = 0.1 
z = 1.5
e = 0.75

## integrate from time point 0 to 15, using 1000 sub-divisions of time ##
t = np.linspace(0, 15, 1000)

## set the initial conditions for the two populations, and convert the two into an array ##
R0 = 10
C0 = 5 
RC0 = np.array([R0, C0])

## numerically integrate this system forward from the starting conditions above ##
pops, infodict = integrate.odeint(dCR_dt, RC0, t, full_output=True)

f1 = p.figure() # open an empty figure f1
p.plot(t, pops[:,0], 'g-', label='Resource density') # Plot
p.plot(t, pops[:,1]  , 'b-', label='Consumer density')
p.grid()
p.legend(loc='best')
p.xlabel('Time')
p.ylabel('Population density')
p.title('Consumer-Resource population dynamics')

f2 = p.figure() # open an empty figure f2
p.plot(pops[:,0], pops[:,1], 'r-') # Plot
p.grid()
p.xlabel('Resource density')
p.ylabel('Consumer density')
p.title('Consumer-Resource population dynamics')

pp = PdfPages('../results/LV_model.pdf')
pp.savefig(f1) # Save the figure f1
pp.savefig(f2) # Save the figure f2
pp.close()