from __future__ import print_function
from potentiostat import Potentiostat
import sys

if len(sys.argv) > 1:
    port = sys.argv[1]
else:
    #port = '/dev/ttyACM0'
    port = '/dev/tty.usbmodem65156601'

dev = Potentiostat(port)

HV = [0,100,200,0]
for v in HV:
    param_rsp = dev.set_HV(v)
    print(param_rsp)

    print(dev.get_HV())
