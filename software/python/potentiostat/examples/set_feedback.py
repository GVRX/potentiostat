from __future__ import print_function
from eclometer.potentiostat import Potentiostat
import sys

if len(sys.argv) > 1:
    port = sys.argv[1]
else:
    #port = '/dev/ttyACM0'
    port = '/dev/tty.usbmodem65156601'


dev = Potentiostat(port, raw = True, debug = True)

if dev:
    print('Device connected: ', dev)


f = 'Current'
param_rsp = dev.set_feedback(f)
print(param_rsp)

rsp = dev.get_feedback()
print(rsp)

f = 'Voltage'
param_rsp = dev.set_feedback(f)
print(param_rsp)

rsp = dev.get_feedback()
print(rsp)

