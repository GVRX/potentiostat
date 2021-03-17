from __future__ import print_function
from potentiostat import Potentiostat
import sys

if len(sys.argv) > 1:
    port = sys.argv[1]
else:
    #port = '/dev/ttyACM0'
    port = '/dev/tty.usbmodem65156601'

dev = Potentiostat(port, raw = True, debug=True)


M = ['IP', 'IV', 'PV']
for m in M:


    print('Setting measurement to {}...'.format(m))
    param_rsp = dev.set_measure(m) 
    print(param_rsp)
