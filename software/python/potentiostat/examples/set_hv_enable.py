from __future__ import print_function
from potentiostat import Potentiostat
import sys

if len(sys.argv) > 1:
    port = sys.argv[1]
else:
    #port = '/dev/ttyACM0'
    port = '/dev/tty.usbmodem65156601'

dev = Potentiostat(port)

#first make it safe to enable HV:
dev.set_HV(1.0)  

param_rsp = dev.set_HVEnable('On')
print(param_rsp)

param_rsp = dev.get_HVEnable()
print(param_rsp)

param_rsp = dev.set_HVEnable('Off')
print(param_rsp)

param_rsp = dev.get_HVEnable()
print(param_rsp)
