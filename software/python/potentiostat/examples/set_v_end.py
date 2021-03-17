from __future__ import print_function
from potentiostat import Potentiostat
import sys

if len(sys.argv) > 1:
    port = sys.argv[1]
else:
    #port = '/dev/ttyACM0'
    port = '/dev/tty.usbmodem65156601'

dev = Potentiostat(port)

Vf = 1.45
param_rsp = dev.set_VEnd(Vf)
print(param_rsp)

param_rsp = dev.get_VEnd()
print(param_rsp)
