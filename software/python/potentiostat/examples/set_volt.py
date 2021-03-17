from __future__ import print_function
from potentiostat import Potentiostat
import sys

if len(sys.argv) > 1:
    port = sys.argv[1]
else:
    #port = '/dev/ttyACM0'
    port = '/dev/tty.usbmodem65156601'

dev = Potentiostat(port)

#Vi = dev.get_volt()
#print(Vi)

samples = 10
param_rsp = dev.set_samples(samples)
print(param_rsp)
