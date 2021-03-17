from __future__ import print_function
from potentiostat import Potentiostat
import sys

if len(sys.argv) > 1:
    port = sys.argv[1]
else:
    #port = '/dev/ttyACM0'
    port = '/dev/tty.usbmodem65156601'

dev = Potentiostat(port)

rate = 0.5
param_rsp = dev.set_ScanRate(rate)
print(param_rsp)

param_rsp = dev.get_ScanRate()
print(param_rsp)
