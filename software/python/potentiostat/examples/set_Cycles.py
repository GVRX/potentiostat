from __future__ import print_function
from eclometer.potentiostat import Potentiostat
import sys

if len(sys.argv) > 1:
    port = sys.argv[1]
else:
    #port = '/dev/ttyACM0'
    port = '/dev/cu.usbmodem65156601'

dev = Potentiostat(port)


param_rsp = dev.set_Cycles(0.0)
print(param_rsp)

rsp = dev.get_Cycles()
print(rsp)

