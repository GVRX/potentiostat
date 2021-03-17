from __future__ import print_function
from potentiostat import Potentiostat
import sys

if len(sys.argv) > 1:
    port = sys.argv[1]
else:
    port = '/dev/tty.usbmodem65156601'

dev = Potentiostat(port)

rsp = dev.get_cell()
print('cell: {0}'.format(rsp))
