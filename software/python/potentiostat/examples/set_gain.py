from __future__ import print_function
from potentiostat import Potentiostat
import sys

if len(sys.argv) > 1:
    port = sys.argv[1]
else:
    #port = '/dev/ttyACM0'
    port = '/dev/tty.usbmodem65156601'

dev = Potentiostat(port)

gain = [0,1,2]
for g in gain:
    param_rsp = dev.set_gain(g)
    print(param_rsp)

rsp = dev.get_gain()
print(rsp)